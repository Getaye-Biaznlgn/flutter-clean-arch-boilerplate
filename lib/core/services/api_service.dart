import 'dart:io';
import 'package:arch_demo/core/constants/app_strings.dart';
import 'package:arch_demo/core/network/network_info.dart';
import 'package:arch_demo/core/services/network_response.dart';
import 'package:arch_demo/core/constants/api_routes.dart';
import 'package:arch_demo/dependency_injection.dart';
import 'package:dio/dio.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class ApiService {
  Dio dio;

  ApiService._internal() : dio = Dio();

  static final ApiService _singleton = ApiService._internal();

  factory ApiService() => _singleton;

  final String baseUrl = ApiRoutes.apiUrl;
  final Map<String, String> headers = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer token',
  };

  Future<void> init() async {
    dio.options = BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: const Duration(milliseconds: 300000),
      connectTimeout: const Duration(milliseconds: 300000),
      sendTimeout: const Duration(milliseconds: 300000),
    );

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse: (Response response, ResponseInterceptorHandler handler) {
          return handler.next(response);
        },
        onError: (DioException error, ErrorInterceptorHandler handler) {
          return handler.next(error);
        },
      ),
    );
  }

  Future<NetworkResponse> apiCall({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    dynamic body,
    String? params,
    required RequestType requestType,
  }) async {
    late Response result;

    String url = ApiRoutes.apiUrl + endPoint;
    if (params != null && params.isNotEmpty) {
      url += params;
    }
    if (queryParameters != null && queryParameters.isNotEmpty) {
      url += "?${Uri(queryParameters: queryParameters).query}";
    }

    try {
      Options options = Options(headers: headers);
      if (!await sl<NetworkInfo>().isConnected) {
        return NetworkResponse.error(noInternetMessage);
      }
      switch (requestType) {
        case RequestType.get:
          result = await dio.get(url,
              queryParameters: queryParameters, options: options);
          break;
        case RequestType.post:
          result = await dio.post(url, data: body, options: options);
          break;
        case RequestType.delete:
          result =
              await dio.delete(url, data: queryParameters, options: options);
          break;
        case RequestType.put:
          result = await dio.put(url, data: queryParameters, options: options);
          break;
        case RequestType.patch:
          result =
              await dio.patch(url, data: queryParameters, options: options);
          break;
      }

      switch (result.statusCode) {
        case 200:
          return NetworkResponse.success(result.data);
        case 201:
          return NetworkResponse.error(result.data['message']);
        case 403:
          return NetworkResponse.error(result.data['message']);
        case 401:
          return NetworkResponse.error("Unauthorized");
        case 431:
          return NetworkResponse.error("Reconnecting");
        case 404:
          return NetworkResponse.error("NotFound");
        case 400:
          return NetworkResponse.error(errorMessage);
      }
      return NetworkResponse.error(errorMessage);
    } on DioException catch (e, stackTrace) {

      if (e.response?.statusCode == 401) {
        return NetworkResponse.error("Something went wrong.");
      }
 Sentry.captureException(e, stackTrace: stackTrace);
      return NetworkResponse.error(errorMessage);
    } catch (e, stackTrace) {
       Sentry.captureException(e, stackTrace: stackTrace);

      return NetworkResponse.error(errorMessage);
    }
  }
}

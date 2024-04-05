import 'package:arch_demo/core/constants/api_routes.dart';
import 'package:arch_demo/core/constants/app_strings.dart';
import 'package:arch_demo/core/services/api_service.dart';
import 'package:arch_demo/core/services/network_response.dart';

abstract class TodoDataSource {
  Future<NetworkResponse> getTodo(int id);
  Future<NetworkResponse> getAllTodos();
}

class TodoDataSourceImpl implements TodoDataSource {
  TodoDataSourceImpl();

  @override
  Future<NetworkResponse> getTodo(int id) async {
    return await ApiService().apiCall(
        endPoint: ApiRoutes.todos,
        requestType: RequestType.post,
        params: "/$id");
  }

  @override
  Future<NetworkResponse> getAllTodos() async {
    return ApiService()
        .apiCall(endPoint: ApiRoutes.todos, requestType: RequestType.get);
  }
}

class NetworkResponse {
  final dynamic data;
  final String? error;
  final bool success; 
  NetworkResponse({required this.data, this.error, required this.success});

  factory NetworkResponse.success(dynamic data) => NetworkResponse(data: data, success: true);

  factory NetworkResponse.error(String error) =>
      NetworkResponse(data: null, error: error, success: false);
}
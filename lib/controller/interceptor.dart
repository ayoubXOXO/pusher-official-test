import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  final String? _token;

  ApiInterceptor(this._token);

  @override
  Future<dynamic> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (_token != null) {
      options.headers.addAll({'Authorization': 'Bearer $_token'});
    }
    return handler.next(options);
  }
}

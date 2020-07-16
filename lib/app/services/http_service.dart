import 'package:dio/dio.dart';

class HttpService {
  final host = 'https://jsonplaceholder.typicode.com/';
  final Dio _dio = Dio();

  HttpService() {
    _dio.options.baseUrl = host;
    _dio.options.headers.addAll({'Content-Type': 'application/json'});
  }

  get(String path, {Map<String, dynamic> params}) async {
    return await _dio.get(path, queryParameters: params);
  }
}

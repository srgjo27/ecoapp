import 'dart:developer' as dev;

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../constants/endpoints.dart';

class DioClient {
  final Dio _dio = Dio();
  String? token;

  DioClient() {
    _dio.options.baseUrl = Endpoints.baseUrl;
    _dio.options.connectTimeout = const Duration(seconds: 60);
    _dio.options.receiveTimeout = const Duration(seconds: 60);
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          dev.log('Request: [${options.method}] ${options.uri}');
          dev.log('Body: ${options.data}');
          return handler.next(options);
        },
        onResponse: (response, handler) {
          dev.log(
              'Response: [${response.statusCode}] ${response.requestOptions.uri}');
          dev.log('Data: ${response.data}');
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          dev.log('Error: ${e.response?.data}');
          dev.log('Message: ${e.message}');
          return handler.next(e);
        },
      ),
    );
  }

  Dio get dio => _dio;

  void updateToken(String newToken) {
    token = newToken;
    final storage = FlutterSecureStorage();
    storage.write(key: 'access_token', value: newToken);
  }
}

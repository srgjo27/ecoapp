import 'package:dio/dio.dart';

import '../../core/constants/endpoints.dart';
import '../../core/utils/dio_client.dart';
import '../../domain/entities/auth.dart';
import '../models/auth/auth_model.dart';

abstract class RemoteDataSource {
  Future<Auth> signIn(String email, String password);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  final DioClient _dioClient;

  RemoteDataSourceImpl(this._dioClient);

  @override
  Future<Auth> signIn(String email, String password) async {
    try {
      final res = await _dioClient.dio.post(
        Endpoints.login,
        data: {
          'email': email,
          'password': password,
        },
      );
      final authModel = AuthModel.fromJson(res.data);
      return authModel.toEntity();
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}

import 'package:dartz/dartz.dart';

import '../../domain/entities/auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<String, Auth>> signIn(String email, String password) async {
    try {
      final authModel = await remoteDataSource.signIn(email, password);
      return Right(authModel);
    } catch (e) {
      return Left(e.toString());
    }
  }
}

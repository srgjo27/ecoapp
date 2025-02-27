import 'package:dartz/dartz.dart';

import '../entities/auth.dart';

abstract class AuthRepository {
  Future<Either<String, Auth>> signIn(String email, String password);
}

import 'package:dartz/dartz.dart';

import '../../data/repositories/auth_repository_impl.dart';
import '../entities/auth.dart';

class AuthUseCase {
  final AuthRepositoryImpl authRepository;

  AuthUseCase(this.authRepository);

  Future<Either<String, Auth>> signIn(String email, String password) {
    return authRepository.signIn(email, password);
  }
}

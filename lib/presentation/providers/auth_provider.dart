import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../core/utils/dio_client.dart';
import '../../data/datasources/remote_data_source.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/entities/auth.dart';
import '../../domain/usecases/auth.dart';

final authUseCaseProvider = Provider<AuthUseCase>((ref) {
  final remoteDataSource = RemoteDataSourceImpl(DioClient());
  final authRepository = AuthRepositoryImpl(remoteDataSource);
  return AuthUseCase(authRepository);
});

final authProvider = AsyncNotifierProvider<AuthNotifier, Auth?>(() {
  return AuthNotifier();
});

class AuthNotifier extends AsyncNotifier<Auth?> {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  @override
  Future<Auth?> build() async {
    // Initialize state if needed (e.g., load token from storage)
    return null;
  }

  Future<void> signIn(String email, String password) async {
    state = const AsyncValue.loading();
    final authUseCase = ref.read(authUseCaseProvider);
    final result = await authUseCase.signIn(email, password);
    result.fold(
      (error) => state = AsyncValue.error(error, StackTrace.current),
      (auth) async {
        state = AsyncValue.data(auth);
        await _storage.write(key: 'access_token', value: auth.accessToken);
        final dioClient = DioClient();
        dioClient.updateToken(auth.accessToken);
      },
    );
  }
}

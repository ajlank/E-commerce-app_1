import 'package:fashionapp/features/auth/domain/entities/user.dart';
import 'package:fashionapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:get_storage/get_storage.dart';

class ProfileLocalDataSource {
  ProfileLocalDataSource({
    required AuthRepository authRepository,
    required GetStorage storage,
  })  : _authRepository = authRepository,
        _storage = storage;

  final AuthRepository _authRepository;
  final GetStorage _storage;

  String? readToken() {
    return _authRepository.readToken();
  }

  User? readCachedUser() {
    final token = readToken();
    if (token == null) {
      return null;
    }
    return _authRepository.readUser(token);
  }

  Future<void> clearSession() async {
    final token = readToken();
    await _storage.remove('accessToken');
    if (token != null) {
      await _storage.remove(token);
    }
  }
}

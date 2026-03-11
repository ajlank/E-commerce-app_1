import '../entities/auth_token.dart';
import '../entities/login.dart';
import '../repositories/auth_repository.dart';

class LoginUser {
  final AuthRepository repository;

  LoginUser(this.repository);

  Future<AuthToken> call(Login data) {
    return repository.login(data);
  }
}

import '../entities/auth_token.dart';
import '../entities/register.dart';
import '../repositories/auth_repository.dart';

class RegisterUser {
  final AuthRepository repository;

  RegisterUser(this.repository);

  Future<AuthToken> call(Register data) {
    return repository.register(data);
  }
}

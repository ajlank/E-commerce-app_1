import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class GetCachedUser {
  final AuthRepository repository;

  GetCachedUser(this.repository);

  User? call() {
    final token = repository.readToken();
    if (token == null) {
      return null;
    }
    return repository.readUser(token);
  }
}

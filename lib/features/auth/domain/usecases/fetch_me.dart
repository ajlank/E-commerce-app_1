import '../entities/user.dart';
import '../repositories/auth_repository.dart';

class FetchMe {
  final AuthRepository repository;

  FetchMe(this.repository);

  Future<User> call(String token) {
    return repository.fetchMe(token);
  }
}

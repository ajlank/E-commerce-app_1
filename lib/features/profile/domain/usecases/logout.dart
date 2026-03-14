import '../repositories/profile_repository.dart';

class Logout {
  Logout(this.repository);

  final ProfileRepository repository;

  Future<void> call() {
    return repository.logout();
  }
}

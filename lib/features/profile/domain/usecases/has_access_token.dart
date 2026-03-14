import '../repositories/profile_repository.dart';

class HasAccessToken {
  HasAccessToken(this.repository);

  final ProfileRepository repository;

  bool call() {
    return repository.hasAccessToken();
  }
}

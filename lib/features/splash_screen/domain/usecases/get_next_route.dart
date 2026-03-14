import '../repositories/splash_repository.dart';

class GetNextRoute {
  GetNextRoute(this.repository);

  final SplashRepository repository;

  Future<String> call() {
    return repository.getNextRoute();
  }
}

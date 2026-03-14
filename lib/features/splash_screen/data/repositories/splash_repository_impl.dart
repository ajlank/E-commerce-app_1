import '../../domain/repositories/splash_repository.dart';
import '../datasources/splash_local_data_source.dart';

class SplashRepositoryImpl implements SplashRepository {
  SplashRepositoryImpl(this.localDataSource);

  final SplashLocalDataSource localDataSource;

  @override
  Future<String> getNextRoute() async {
    return localDataSource.readFirstOpen() == null
        ? '/onboarding'
        : '/home';
  }
}

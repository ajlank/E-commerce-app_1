import 'package:fashionapp/features/auth/domain/entities/user.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_local_data_source.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl(this.localDataSource);

  final ProfileLocalDataSource localDataSource;

  @override
  User? getCachedUser() {
    return localDataSource.readCachedUser();
  }

  @override
  bool hasAccessToken() {
    return localDataSource.readToken() != null;
  }

  @override
  Future<void> logout() {
    return localDataSource.clearSession();
  }
}

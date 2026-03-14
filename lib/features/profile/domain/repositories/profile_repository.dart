import 'package:fashionapp/features/auth/domain/entities/user.dart';

abstract class ProfileRepository {
  User? getCachedUser();
  bool hasAccessToken();
  Future<void> logout();
}

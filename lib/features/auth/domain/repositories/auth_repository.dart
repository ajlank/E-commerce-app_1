import '../entities/auth_token.dart';
import '../entities/login.dart';
import '../entities/register.dart';
import '../entities/user.dart';

abstract class AuthRepository {
  Future<AuthToken> login(Login data);
  Future<AuthToken> register(Register data);
  Future<User> fetchMe(String token);

  Future<void> cacheToken(String token);
  String? readToken();

  Future<void> cacheUser(String token, User user);
  User? readUser(String token);
}

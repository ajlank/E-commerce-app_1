import 'package:get_storage/get_storage.dart';

import '../../domain/entities/auth_token.dart';
import '../../domain/entities/login.dart';
import '../../domain/entities/register.dart';
import '../../domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.storage,
  });

  final AuthRemoteDataSource remoteDataSource;
  final GetStorage storage;

  @override
  Future<AuthToken> login(Login data) async {
    return remoteDataSource.login(LoginModel.fromEntity(data));
  }

  @override
  Future<AuthToken> register(Register data) async {
    return remoteDataSource.register(RegisterModel.fromEntity(data));
  }

  @override
  Future<User> fetchMe(String token) async {
    return remoteDataSource.fetchMe(token);
  }

  @override
  Future<void> cacheToken(String token) async {
    await storage.write('accessToken', token);
  }

  @override
  String? readToken() {
    return storage.read('accessToken');
  }

  @override
  Future<void> cacheUser(String token, User user) async {
    final model = UserModel.fromEntity(user);
    await storage.write(token, userModelToJson(model));
  }

  @override
  User? readUser(String token) {
    final data = storage.read(token);
    if (data == null) {
      return null;
    }
    return userModelFromJson(data);
  }
}

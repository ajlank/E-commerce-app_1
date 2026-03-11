import 'package:http/http.dart' as http;

import '../models/auth_token_model.dart';
import '../models/login_model.dart';
import '../models/register_model.dart';
import '../models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthTokenModel> login(LoginModel data);
  Future<AuthTokenModel> register(RegisterModel data);
  Future<UserModel> fetchMe(String token);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<AuthTokenModel> login(LoginModel data) async {
    final url = Uri.parse('http://192.168.0.106:8000/auth/token/login/');
    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: loginModelToJson(data),
    );

    if (response.statusCode == 200) {
      return authTokenFromJson(response.body);
    }

    throw Exception('Login failed');
  }

  @override
  Future<AuthTokenModel> register(RegisterModel data) async {
    final url = Uri.parse('http://192.168.0.106:8000/auth/users/');
    final response = await client.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: registerModelToJson(data),
    );

    if (response.statusCode == 201) {
      return authTokenFromJson(response.body);
    }

    throw Exception('Registration failed');
  }

  @override
  Future<UserModel> fetchMe(String token) async {
    final url = Uri.parse('http://192.168.0.106:8000/auth/users/me/');
    final response = await client.get(
      url,
      headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return userModelFromJson(response.body);
    }

    throw Exception('Fetch user failed');
  }
}

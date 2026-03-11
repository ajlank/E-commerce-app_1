import 'dart:convert';

import '../../domain/entities/login.dart';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel extends Login {
  const LoginModel({
    required super.password,
    required super.username,
  });

  factory LoginModel.fromEntity(Login entity) => LoginModel(
        username: entity.username,
        password: entity.password,
      );

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        password: json["password"] ?? '',
        username: json["username"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "password": password,
        "username": username,
      };
}

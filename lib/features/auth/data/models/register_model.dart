import 'dart:convert';

import '../../domain/entities/register.dart';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel extends Register {
  const RegisterModel({
    required super.email,
    required super.username,
    required super.password,
  });

  factory RegisterModel.fromEntity(Register entity) => RegisterModel(
        email: entity.email,
        username: entity.username,
        password: entity.password,
      );

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        email: json["email"] ?? '',
        username: json["username"] ?? '',
        password: json["password"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "username": username,
        "password": password,
      };
}

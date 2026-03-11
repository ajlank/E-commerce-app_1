import 'dart:convert';

import '../../domain/entities/user.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User {
  const UserModel({
    required super.email,
    required super.id,
    required super.username,
  });

  factory UserModel.fromEntity(User entity) => UserModel(
        email: entity.email,
        id: entity.id,
        username: entity.username,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"] ?? '',
        id: json["id"] ?? 0,
        username: json["username"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "username": username,
      };
}

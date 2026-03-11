import 'dart:convert';

import '../../domain/entities/auth_token.dart';

AuthTokenModel authTokenFromJson(String str) =>
    AuthTokenModel.fromJson(json.decode(str));

String authTokenToJson(AuthTokenModel data) => json.encode(data.toJson());

class AuthTokenModel extends AuthToken {
  const AuthTokenModel({required super.authToken});

  factory AuthTokenModel.fromJson(Map<String, dynamic> json) =>
      AuthTokenModel(
        authToken: json["auth_token"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "auth_token": authToken,
      };
}

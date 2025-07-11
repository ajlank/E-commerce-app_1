
import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    final String email;
    final int id;
    final String username;

    UserModel({
        required this.email,
        required this.id,
        required this.username,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json["email"],
        id: json["id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "id": id,
        "username": username,
    };
}

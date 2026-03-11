import 'dart:convert';

import '../../domain/entities/address.dart';

List<AddressModel> addressListFromJson(String str) =>
    List<AddressModel>.from(
      json.decode(str).map((x) => AddressModel.fromJson(x)),
    );

AddressModel addressDefaultFromJson(String str) =>
    AddressModel.fromJson(json.decode(str));

class AddressModel extends Address {
  const AddressModel({
    required super.id,
    required super.lat,
    required super.lan,
    required super.isDefault,
    required super.address,
    required super.phone,
    required super.addressType,
    required super.userId,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) => AddressModel(
        id: json["id"] ?? 0,
        lat: (json["lat"] ?? 0).toDouble(),
        lan: (json["lan"] ?? 0).toDouble(),
        isDefault: json["isDefault"] ?? false,
        address: json["address"] ?? '',
        phone: json["phone"] ?? '',
        addressType: json["addressType"] ?? '',
        userId: json["userId"] ?? 0,
      );
}

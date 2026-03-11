import 'dart:convert';

import '../../domain/entities/create_address.dart';

CreateAddressModel createAddressFromJson(String str) =>
    CreateAddressModel.fromJson(json.decode(str));

String createAddressToJson(CreateAddress data) =>
    json.encode(CreateAddressModel.fromEntity(data).toJson());

class CreateAddressModel extends CreateAddress {
  const CreateAddressModel({
    required super.lat,
    required super.lan,
    required super.isDefault,
    required super.address,
    required super.phone,
    required super.addressType,
  });

  factory CreateAddressModel.fromEntity(CreateAddress entity) =>
      CreateAddressModel(
        lat: entity.lat,
        lan: entity.lan,
        isDefault: entity.isDefault,
        address: entity.address,
        phone: entity.phone,
        addressType: entity.addressType,
      );

  factory CreateAddressModel.fromJson(Map<String, dynamic> json) =>
      CreateAddressModel(
        lat: (json["lat"] ?? 0).toDouble(),
        lan: (json["lan"] ?? 0).toDouble(),
        isDefault: json["isDefault"] ?? false,
        address: json["address"] ?? '',
        phone: json["phone"] ?? '',
        addressType: json["addressType"] ?? '',
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lan": lan,
        "isDefault": isDefault,
        "address": address,
        "phone": phone,
        "addressType": addressType,
      };
}

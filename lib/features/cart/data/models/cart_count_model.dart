import 'dart:convert';

import '../../domain/entities/cart_count.dart';

CartCountModel cartCountFromJson(String str) =>
    CartCountModel.fromJson(json.decode(str));

String cartCountToJson(CartCount data) =>
    json.encode(CartCountModel.fromEntity(data).toJson());

class CartCountModel extends CartCount {
    const CartCountModel({required super.cartCount});

    factory CartCountModel.fromEntity(CartCount entity) =>
        CartCountModel(cartCount: entity.cartCount);

    factory CartCountModel.fromJson(Map<String, dynamic> json) =>
        CartCountModel(cartCount: json["cart_count"] ?? 0);

    Map<String, dynamic> toJson() => {
        "cart_count": cartCount,
    };
}

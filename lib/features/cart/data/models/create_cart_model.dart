import 'dart:convert';

import '../../domain/entities/create_cart.dart';

CreateCartModel createCartFromJson(String str) =>
    CreateCartModel.fromJson(json.decode(str));

String createCartToJson(CreateCart data) =>
    json.encode(CreateCartModel.fromEntity(data).toJson());

class CreateCartModel extends CreateCart {
    const CreateCartModel({
        required super.product,
        required super.quantity,
        required super.size,
        required super.color,
    });

    factory CreateCartModel.fromEntity(CreateCart entity) => CreateCartModel(
        product: entity.product,
        quantity: entity.quantity,
        size: entity.size,
        color: entity.color,
    );

    factory CreateCartModel.fromJson(Map<String, dynamic> json) =>
        CreateCartModel(
        product: json["product"],
        quantity: json["quantity"],
        size: json["size"],
        color: json["color"],
    );

    Map<String, dynamic> toJson() => {
        "product": product,
        "quantity": quantity,
        "size": size,
        "color": color,
    };
}

import 'dart:convert';

import 'package:fashionapp/src/model/products_model.dart';

CreateCart createCartFromJson(String str) => CreateCart.fromJson(json.decode(str));

String createCartToJson(CreateCart data) => json.encode(data.toJson());

class CreateCart {
    final int product;
    final int quantity;
    final String size;
    final String color;

    CreateCart({
        required this.product,
        required this.quantity,
        required this.size,
        required this.color,
    });

    factory CreateCart.fromJson(Map<String, dynamic> json) => CreateCart(
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

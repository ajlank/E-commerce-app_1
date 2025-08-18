import 'dart:convert';

CreateCheckOut createCheckOutFromJson(String str) =>
    CreateCheckOut.fromJson(json.decode(str));

String createCheckOutToJson(CreateCheckOut data) => json.encode(data.toJson());

class CreateCheckOut {
  final String accessToken;
  final String fcm;
  final double totalAmount;
  final List<CartItem> cartItems;
  final int address;

  CreateCheckOut({
    required this.accessToken,
    required this.fcm,
    required this.totalAmount,
    required this.cartItems,
    required this.address,
  });

  factory CreateCheckOut.fromJson(Map<String, dynamic> json) => CreateCheckOut(
    accessToken: json["accessToken"],
    fcm: json["fcm"],
    totalAmount: (json["totalAmount"]?.toDouble()) ?? 0.0,
    cartItems: json["cartItems"] == null
        ? []
        : List<CartItem>.from(
            (json["cartItems"] as List).map((x) => CartItem.fromJson(x)),
          ),
    address: json["address"],
  );

  Map<String, dynamic> toJson() => {
    "accessToken": accessToken,
    "fcm": fcm,
    "totalAmount": totalAmount,
    "cartItems": List<dynamic>.from(cartItems.map((x) => x.toJson())),
    "address": address,
  };
}

class CartItem {
  final String name;
  final String size;
  final String color;
  final int id;
  final double price;
  final int cartQuantity;

  CartItem({
    required this.name,
    required this.size,
    required this.color,
    required this.id,
    required this.price,
    required this.cartQuantity,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
    name: json["name"],
    size: json["size"],
    color: json["color"],
    id: int.parse(json["id"].toString()),
    price: double.parse(json["price"].toString()),
    cartQuantity: int.parse(json["cartQuantity"].toString()),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "size": size,
    "color": color,
    "id": id,
    "price": price,
    "cartQuantity": cartQuantity,
  };
}

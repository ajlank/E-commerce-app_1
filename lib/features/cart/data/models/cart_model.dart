import 'dart:convert';

import 'package:fashionapp/features/products/data/models/products_model.dart';

import '../../domain/entities/cart.dart';

List<CartModel> cartModelFromJson(String str) => List<CartModel>.from(json.decode(str).map((x) => CartModel.fromJson(x)));

String cartModelToJson(List<CartModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CartModel extends Cart {
    CartModel({
        required super.id,
        required super.product,
        required super.quantity,
        required super.size,
        required super.color,
    });

    factory CartModel.fromJson(Map<String, dynamic> json) {
      return CartModel(
        id: json["id"],
        product: Products.fromJson(json["product"]),
        quantity: json["quantity"],
        size: json["size"] ?? "",
        color: json["color"] ?? "", 
      );
}
    Map<String, dynamic> toJson() => {
        "id": id,
        "product": product.toJson(),
        "quantity": quantity,
        "size": size,
        "color": color,
    };
}

// class Product {
//     final int id;
//     final String title;
//     final double price;
//     final String description;
//     final bool isFeatured;
//     final String collectionType;
//     final double ratings;
//     final List<String> colors;
//     final List<String> sizes;
//     final List<String> imageUrls;
//     final DateTime createdAt;
//     final int category;
//     final int brand;

//     Product({
//         required this.id,
//         required this.title,
//         required this.price,
//         required this.description,
//         required this.isFeatured,
//         required this.collectionType,
//         required this.ratings,
//         required this.colors,
//         required this.sizes,
//         required this.imageUrls,
//         required this.createdAt,
//         required this.category,
//         required this.brand,
//     });

//     factory Product.fromJson(Map<String, dynamic> json) => Product(
//         id: json["id"],
//         title: json["title"],
//         price: json["price"]?.toDouble(),
//         description: json["description"],
//         isFeatured: json["is_featured"],
//         collectionType: json["collectionType"],
//         ratings: json["ratings"]?.toDouble(),
//         colors: List<String>.from(json["colors"].map((x) => x)),
//         sizes: List<String>.from(json["sizes"].map((x) => x)),
//         imageUrls: List<String>.from(json["imageUrls"].map((x) => x)),
//         createdAt: DateTime.parse(json["created_at"]),
//         category: json["category"],
//         brand: json["brand"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "title": title,
//         "price": price,
//         "description": description,
//         "is_featured": isFeatured,
//         "collectionType": collectionType,
//         "ratings": ratings,
//         "colors": List<dynamic>.from(colors.map((x) => x)),
//         "sizes": List<dynamic>.from(sizes.map((x) => x)),
//         "imageUrls": List<dynamic>.from(imageUrls.map((x) => x)),
//         "created_at": createdAt.toIso8601String(),
//         "category": category,
//         "brand": brand,
//     };
// }

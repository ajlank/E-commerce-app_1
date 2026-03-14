import 'dart:convert';

List<Products> productsFromJson(String str) =>
    List<Products>.from(json.decode(str).map((x) => Products.fromJson(x)));

String productsToJson(List<Products> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Products {
  final int id;
  final String title;
  final double price;
  final String description;
  final bool isFeatured;
  final String clothesTypes;
  final double ratings;
  final List<String> colors;
  final List<String> sizes;
  final List<String> images;
  final DateTime createdAt;
  final int category;
  final int brand;

  Products({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.isFeatured,
    required this.clothesTypes,
    required this.ratings,
    required this.colors,
    required this.sizes,
    required this.images,
    required this.createdAt,
    required this.category,
    required this.brand,
  });

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        id: json["id"],
        title: json["title"] ?? '',
        price: (json["price"] as num?)?.toDouble() ?? 0.0,
        description: json["description"] ?? '',
        isFeatured: json["is_featured"] ?? false,
        clothesTypes: json["clothesTypes"] ?? '',
        ratings: (json["ratings"] as num?)?.toDouble() ?? 0.0,
        colors: List<String>.from(json["colors"] ?? []),
        sizes: List<String>.from(json["sizes"] ?? []),
        images: List<String>.from(json["images"] ?? []),
        createdAt: json["createdAt"] != null
            ? DateTime.parse(json["createdAt"])
            : DateTime.now(),
        category: json["category"] ?? 0,
        brand: json["brand"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "is_featured": isFeatured,
        "clothesTypes": clothesTypes,
        "ratings": ratings,
        "colors": colors,
        "sizes": sizes,
        "images": images,
        "createdAt": createdAt.toIso8601String(),
        "category": category,
        "brand": brand,
      };
}

import '../../domain/entities/home_product.dart';

class HomeProductModel extends HomeProduct {
  const HomeProductModel({
    required super.id,
    required super.title,
    required super.price,
    required super.description,
    required super.isFeatured,
    required super.clothesTypes,
    required super.ratings,
    required super.colors,
    required super.images,
    required super.sizes,
    required super.createdAt,
    required super.category,
    required super.brand,
  });

  factory HomeProductModel.fromJson(Map<String, dynamic> json) =>
      HomeProductModel(
        id: json['id'],
        title: json['title'] ?? '',
        price: (json['price'] as num?)?.toDouble() ?? 0.0,
        description: json['description'] ?? '',
        isFeatured: json['is_featured'] ?? false,
        clothesTypes: json['clothesTypes'] ?? '',
        ratings: (json['ratings'] as num?)?.toDouble() ?? 0.0,
        colors: List<String>.from(json['colors'] ?? []),
        sizes: List<String>.from(json['sizes'] ?? []),
        images: List<String>.from(json['images'] ?? []),
        createdAt: json['createdAt'] != null
            ? DateTime.parse(json['createdAt'])
            : DateTime.now(),
        category: json['category'] ?? 0,
        brand: json['brand'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'price': price,
        'description': description,
        'is_featured': isFeatured,
        'clothesTypes': clothesTypes,
        'ratings': ratings,
        'colors': colors,
        'sizes': sizes,
        'images': images,
        'createdAt': createdAt.toIso8601String(),
        'category': category,
        'brand': brand,
      };
}

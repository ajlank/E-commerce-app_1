class HomeProduct {
  const HomeProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.isFeatured,
    required this.clothesTypes,
    required this.ratings,
    required this.colors,
    required this.images,
    required this.sizes,
    required this.createdAt,
    required this.category,
    required this.brand,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final bool isFeatured;
  final String clothesTypes;
  final double ratings;
  final List<String> colors;
  final List<String> images;
  final List<String> sizes;
  final DateTime createdAt;
  final int category;
  final int brand;
}

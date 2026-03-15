import 'package:fashionapp/features/products/data/models/products_model.dart';

class Cart {
  const Cart({
    required this.id,
    required this.product,
    required this.quantity,
    required this.size,
    required this.color,
  });

  final int id;
  final Products product;
  final int quantity;
  final String? size;
  final String? color;
}

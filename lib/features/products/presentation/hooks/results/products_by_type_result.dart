import 'package:fashionapp/src/model/products_model.dart';
import 'package:flutter/foundation.dart';

class ProductsByTypeResult {
  ProductsByTypeResult({
    required this.products,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });

  final List<Products> products;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;
}

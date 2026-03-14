import 'package:flutter/foundation.dart' hide Category;
import '../../../domain/entities/category.dart';

class CategoriesResult {
  CategoriesResult({
    required this.categories,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });

  final List<Category> categories;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;
}

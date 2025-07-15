import 'package:fashionapp/src/model/categories_model.dart';
import 'package:flutter/foundation.dart';

class FetchCategories {
    
    final List<Categories>categories;
    final bool isLoading;
    final String? error;
    final VoidCallback refetch;

    FetchCategories({required this.categories, required this.isLoading, required this.error, required this.refetch});
  
}
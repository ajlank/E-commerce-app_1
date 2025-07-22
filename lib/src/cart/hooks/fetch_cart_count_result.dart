import 'package:fashionapp/src/cart/model/cart_count_model.dart';
import 'package:flutter/foundation.dart';

class FetchCartCountResult {
    
    final CartCount count;
    final bool isLoading;
    final String? error;
    final VoidCallback refetch;

   FetchCartCountResult({required this.count, required this.isLoading, required this.error, required this.refetch});
  
}
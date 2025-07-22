import 'package:fashionapp/src/cart/model/cart_model.dart';
import 'package:flutter/foundation.dart';

class FetchCartResult{
    
    final List<CartModel>cart;
    final bool isLoading;
    final String? error;
    final VoidCallback refetch;

    FetchCartResult({required this.cart, required this.isLoading, required this.error, required this.refetch});
  
}
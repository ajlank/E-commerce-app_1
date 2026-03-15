
import 'package:fashionapp/features/products/data/models/products_model.dart';
import 'package:flutter/material.dart';

class FetchProductByCategoriesResult {

  final List<Products> products;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;

  FetchProductByCategoriesResult({
   required this.products,
   required this.isLoading, 
   required this.error,
   required this.refetch});

}
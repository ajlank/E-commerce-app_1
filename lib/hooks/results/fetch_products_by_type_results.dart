import 'package:fashionapp/src/model/products_model.dart';
import 'package:flutter/material.dart';

class FetchProductsByTypeResults {

  final List<Products> products;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;
  FetchProductsByTypeResults({
    required this.refetch, 
    required this.products,
    required this.isLoading,
    required this.error});

}
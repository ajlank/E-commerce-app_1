import 'dart:convert';

import 'package:fashionapp/src/model/products_model.dart';
import 'package:http/http.dart' as http;

import '../models/category_model.dart';

class CategoryRemoteDataSource {
  CategoryRemoteDataSource({http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  Future<List<CategoryModel>> fetchCategories() async {
    final url = Uri.parse('http://192.168.0.106:8000/api/product/categories/');
    final response = await _client.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data
          .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Failed to load categories');
  }

  Future<List<CategoryModel>> fetchHomeCategories() async {
    final url =
        Uri.parse('http://192.168.0.106:8000/api/product/categories/home/');
    final response = await _client.get(url);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data
          .map((item) => CategoryModel.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Failed to load home categories');
  }

  Future<List<Products>> fetchProductsByCategory(int categoryId) async {
    final url = Uri.parse(
      'http://192.168.0.106:8000/api/product/category/?category=$categoryId',
    );
    final response = await _client.get(url);
    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    }
    throw Exception('Failed to load category products');
  }
}

import 'package:fashionapp/features/products/data/models/products_model.dart';

abstract class SearchRepository {
  Future<List<Products>> searchProducts(String query);
}

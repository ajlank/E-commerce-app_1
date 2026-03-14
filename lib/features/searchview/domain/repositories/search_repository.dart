import 'package:fashionapp/src/model/products_model.dart';

abstract class SearchRepository {
  Future<List<Products>> searchProducts(String query);
}

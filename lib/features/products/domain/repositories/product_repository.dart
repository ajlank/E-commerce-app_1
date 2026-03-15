import 'package:fashionapp/common/utils/enums.dart';
import 'package:fashionapp/features/products/data/models/products_model.dart';

abstract class ProductRepository {
  Future<List<Products>> fetchRecommendedProducts(int categoryId);
  Future<List<Products>> fetchProductsByType(QueryType queryType);
}

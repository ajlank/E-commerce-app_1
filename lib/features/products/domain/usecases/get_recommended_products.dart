import 'package:fashionapp/src/model/products_model.dart';
import '../repositories/product_repository.dart';

class GetRecommendedProducts {
  GetRecommendedProducts(this.repository);

  final ProductRepository repository;

  Future<List<Products>> call(int categoryId) {
    return repository.fetchRecommendedProducts(categoryId);
  }
}

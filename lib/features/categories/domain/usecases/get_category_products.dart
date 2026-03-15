import 'package:fashionapp/features/products/data/models/products_model.dart';
import '../repositories/category_repository.dart';

class GetCategoryProducts {
  GetCategoryProducts(this.repository);

  final CategoryRepository repository;

  Future<List<Products>> call(int categoryId) {
    return repository.fetchProductsByCategory(categoryId);
  }
}

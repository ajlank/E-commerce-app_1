import 'package:fashionapp/features/products/data/models/products_model.dart';
import '../entities/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> fetchCategories();
  Future<List<Category>> fetchHomeCategories();
  Future<List<Products>> fetchProductsByCategory(int categoryId);
}

import '../entities/category.dart';
import '../repositories/category_repository.dart';

class GetCategories {
  GetCategories(this.repository);

  final CategoryRepository repository;

  Future<List<Category>> call() {
    return repository.fetchCategories();
  }
}

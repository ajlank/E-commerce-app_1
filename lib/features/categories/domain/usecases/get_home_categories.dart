import '../entities/category.dart';
import '../repositories/category_repository.dart';

class GetHomeCategories {
  GetHomeCategories(this.repository);

  final CategoryRepository repository;

  Future<List<Category>> call() {
    return repository.fetchHomeCategories();
  }
}

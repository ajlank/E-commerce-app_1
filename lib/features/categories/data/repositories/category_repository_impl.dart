import 'package:fashionapp/src/model/products_model.dart';
import '../../domain/entities/category.dart';
import '../../domain/repositories/category_repository.dart';
import '../datasources/category_remote_data_source.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  CategoryRepositoryImpl(this.remoteDataSource);

  final CategoryRemoteDataSource remoteDataSource;

  @override
  Future<List<Category>> fetchCategories() async {
    return remoteDataSource.fetchCategories();
  }

  @override
  Future<List<Category>> fetchHomeCategories() async {
    return remoteDataSource.fetchHomeCategories();
  }

  @override
  Future<List<Products>> fetchProductsByCategory(int categoryId) async {
    return remoteDataSource.fetchProductsByCategory(categoryId);
  }
}

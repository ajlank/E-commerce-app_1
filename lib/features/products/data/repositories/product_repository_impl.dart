import 'package:fashionapp/common/utils/enums.dart';
import 'package:fashionapp/src/model/products_model.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/product_remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl(this.remoteDataSource);

  final ProductRemoteDataSource remoteDataSource;

  @override
  Future<List<Products>> fetchRecommendedProducts(int categoryId) {
    return remoteDataSource.fetchRecommendedProducts(categoryId);
  }

  @override
  Future<List<Products>> fetchProductsByType(QueryType queryType) {
    return remoteDataSource.fetchProductsByType(queryType);
  }
}

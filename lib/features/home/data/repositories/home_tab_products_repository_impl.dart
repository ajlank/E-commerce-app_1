import '../../domain/entities/home_product.dart';
import '../../domain/repositories/home_tab_products_repository.dart';
import '../datasources/home_tab_products_local_data_source.dart';

class HomeTabProductsRepositoryImpl implements HomeTabProductsRepository {
  HomeTabProductsRepositoryImpl(this.localDataSource);

  final HomeTabProductsLocalDataSource localDataSource;

  @override
  Future<List<HomeProduct>> fetchHomeTabProducts() async {
    return localDataSource.fetchHomeTabProducts();
  }
}

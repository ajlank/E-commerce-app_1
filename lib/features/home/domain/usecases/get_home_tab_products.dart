import '../entities/home_product.dart';
import '../repositories/home_tab_products_repository.dart';

class GetHomeTabProducts {
  GetHomeTabProducts(this.repository);

  final HomeTabProductsRepository repository;

  Future<List<HomeProduct>> call() {
    return repository.fetchHomeTabProducts();
  }
}

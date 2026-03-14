import '../entities/home_product.dart';

abstract class HomeTabProductsRepository {
  Future<List<HomeProduct>> fetchHomeTabProducts();
}

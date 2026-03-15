import 'package:fashionapp/features/products/data/models/products_model.dart';

abstract class WishlistRepository {
  Future<List<Products>> fetchWishlist();
  Future<void> toggleWishlist(int productId);
  List<int> getWishlistIds();
}

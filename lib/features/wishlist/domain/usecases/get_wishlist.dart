import 'package:fashionapp/src/model/products_model.dart';
import '../repositories/wishlist_repository.dart';

class GetWishlist {
  GetWishlist(this.repository);

  final WishlistRepository repository;

  Future<List<Products>> call() {
    return repository.fetchWishlist();
  }
}

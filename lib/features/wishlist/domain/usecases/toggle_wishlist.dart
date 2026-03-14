import '../repositories/wishlist_repository.dart';

class ToggleWishlist {
  ToggleWishlist(this.repository);

  final WishlistRepository repository;

  Future<void> call(int productId) {
    return repository.toggleWishlist(productId);
  }
}

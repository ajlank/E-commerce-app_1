import '../repositories/wishlist_repository.dart';

class GetWishlistIds {
  GetWishlistIds(this.repository);

  final WishlistRepository repository;

  List<int> call() {
    return repository.getWishlistIds();
  }
}

import '../entities/cart_count.dart';
import '../repositories/cart_repository.dart';

class FetchCartCount {
  FetchCartCount(this.repository);

  final CartRepository repository;

  Future<CartCount> call() {
    return repository.fetchCartCount();
  }
}

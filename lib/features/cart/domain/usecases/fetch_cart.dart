import '../entities/cart.dart';
import '../repositories/cart_repository.dart';

class FetchCart {
  FetchCart(this.repository);

  final CartRepository repository;

  Future<List<Cart>> call() {
    return repository.fetchCart();
  }
}

import '../repositories/cart_repository.dart';

class AddToCart {
  AddToCart(this.repository);

  final CartRepository repository;

  Future<bool> call(String data) {
    return repository.addToCart(data);
  }
}

import '../repositories/cart_repository.dart';

class DeleteCartItem {
  DeleteCartItem(this.repository);

  final CartRepository repository;

  Future<bool> call(int id) {
    return repository.deleteCartItem(id);
  }
}

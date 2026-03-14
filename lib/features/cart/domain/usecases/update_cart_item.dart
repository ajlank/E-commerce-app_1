import '../repositories/cart_repository.dart';

class UpdateCartItem {
  UpdateCartItem(this.repository);

  final CartRepository repository;

  Future<bool> call({required int id, required int count}) {
    return repository.updateCartItem(id: id, count: count);
  }
}

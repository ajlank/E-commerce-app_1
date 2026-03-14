import '../repositories/cart_repository.dart';

class CreateCheckout {
  CreateCheckout(this.repository);

  final CartRepository repository;

  Future<String?> call(String data) {
    return repository.createCheckout(data);
  }
}

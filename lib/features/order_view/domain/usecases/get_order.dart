import '../entities/order.dart';
import '../repositories/order_repository.dart';

class GetOrder {
  GetOrder(this.repository);

  final OrderRepository repository;

  Future<OrderEntity?> call(int id) {
    return repository.fetchOrder(id);
  }
}

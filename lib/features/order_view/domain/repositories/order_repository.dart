import '../entities/order.dart';

abstract class OrderRepository {
  Future<OrderEntity?> fetchOrder(int id);
}

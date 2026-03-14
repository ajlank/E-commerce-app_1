import '../../domain/entities/order.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/order_local_data_source.dart';
import '../datasources/order_remote_data_source.dart';

class OrderRepositoryImpl implements OrderRepository {
  OrderRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final OrderRemoteDataSource remoteDataSource;
  final OrderLocalDataSource localDataSource;

  @override
  Future<OrderEntity?> fetchOrder(int id) async {
    final token = localDataSource.readToken();
    if (token == null) {
      return null;
    }
    return remoteDataSource.fetchOrder(token, id);
  }
}

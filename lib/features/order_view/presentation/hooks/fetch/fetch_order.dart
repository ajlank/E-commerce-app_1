import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/datasources/order_local_data_source.dart';
import '../../../data/datasources/order_remote_data_source.dart';
import '../../../data/repositories/order_repository_impl.dart';
import '../../../domain/entities/order.dart';
import '../../../domain/usecases/get_order.dart';
import '../results/order_result.dart';

OrderResult fetchOrder(int id) {
  final order = useState<OrderEntity?>(null);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  final repository = OrderRepositoryImpl(
    remoteDataSource: OrderRemoteDataSource(),
    localDataSource: OrderLocalDataSource(GetStorage()),
  );
  final getOrder = GetOrder(repository);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      order.value = await getOrder(id);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, const []);

  void refetch() {
    isLoading.value = false;
    fetchData();
  }

  return OrderResult(
    order: order.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}

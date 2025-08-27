import 'package:fashionapp/src/orders/models/order_models.dart';
import 'package:fashionapp/src/orders/results/fetch_order_result.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

FetchOrderResult fetchOrder(int id) {
  final order = useState<OrderModel?>(null);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  String? accessToken = GetStorage().read('accessToken');
  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse(
        "http://192.168.0.106:8000/api/orders/single/?id=$id",
      );
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        order.value = orderModelSingleFromJson(response.body);
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    if (accessToken != null) {
      fetchData();
    }
    return;
  }, const []);

  void refetch() {
    isLoading.value = false;
    fetchData();
  }

  return FetchOrderResult(
    order: order.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}

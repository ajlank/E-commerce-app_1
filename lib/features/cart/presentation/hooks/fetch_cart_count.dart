import 'package:fashionapp/features/cart/domain/entities/cart_count.dart';
import 'package:fashionapp/features/cart/domain/repositories/cart_repository.dart';
import 'package:fashionapp/features/cart/domain/usecases/fetch_cart_count.dart';
import 'package:fashionapp/features/cart/presentation/controllers/cart_notifier.dart';
import 'package:fashionapp/features/cart/presentation/hooks/results/fetch_cart_count_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

FetchCartCountResult fetchCartCount(BuildContext context) {
  final repository = context.read<CartRepository>();
  final fetchCartCountUsecase = FetchCartCount(repository);
  final initialCount = CartCount(cartCount: 0);
  final count = useState<CartCount>(initialCount);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  String? accessToken = GetStorage().read('accessToken');
  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      count.value = await fetchCartCountUsecase();
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

  context.read<CartNotifier>().setRefetchCount(refetch);

  return FetchCartCountResult(
    count: count.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}

// 6:28:32

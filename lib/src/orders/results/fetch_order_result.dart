import 'package:fashionapp/src/orders/models/order_models.dart';
import 'package:flutter/foundation.dart';

class FetchOrderResult {
  final OrderModel? order;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;

  FetchOrderResult({
    required this.order,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });
}

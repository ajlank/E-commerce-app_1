import 'package:flutter/foundation.dart';
import '../../../domain/entities/order.dart';

class OrderResult {
  OrderResult({
    required this.order,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });

  final OrderEntity? order;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;
}

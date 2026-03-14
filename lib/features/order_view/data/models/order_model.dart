import '../../domain/entities/order.dart';

class OrderModel extends OrderEntity {
  OrderModel({
    required super.id,
    required super.customerId,
    required super.orderProducts,
    required super.rated,
    required super.totalQuantity,
    required super.subtotal,
    required super.total,
    required super.deliveryStatus,
    required super.paymentStatus,
    required super.createdAt,
    required super.updatedAt,
    required super.user,
    required super.address,
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
        id: json['id'],
        customerId: json['customer_id'],
        orderProducts: List<OrderProductEntity>.from(
          json['order_products'].map((x) => OrderProductModel.fromJson(x)),
        ),
        rated: List<int>.from(json['rated'].map((x) => x)),
        totalQuantity: json['total_quantity'],
        subtotal: json['subtotal'],
        total: json['total'],
        deliveryStatus: json['delivery_status'],
        paymentStatus: json['payment_status'],
        createdAt: DateTime.parse(json['created_at']),
        updatedAt: DateTime.parse(json['updated_at']),
        user: json['user'],
        address: json['address'],
      );
}

class OrderProductModel extends OrderProductEntity {
  const OrderProductModel({
    required super.productId,
    required super.imageUrl,
    required super.title,
    required super.price,
    required super.quantity,
    required super.size,
    required super.color,
  });

  factory OrderProductModel.fromJson(Map<String, dynamic> json) =>
      OrderProductModel(
        productId: json['product_id'],
        imageUrl: json['imageUrl'],
        title: json['title'],
        price: json['price']?.toDouble() ?? 0.0,
        quantity: json['quantity'],
        size: json['size'],
        color: json['color'],
      );
}

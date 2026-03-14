class OrderEntity {
  const OrderEntity({
    required this.id,
    required this.customerId,
    required this.orderProducts,
    required this.rated,
    required this.totalQuantity,
    required this.subtotal,
    required this.total,
    required this.deliveryStatus,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.user,
    required this.address,
  });

  final int id;
  final String customerId;
  final List<OrderProductEntity> orderProducts;
  final List<int> rated;
  final int totalQuantity;
  final int subtotal;
  final int total;
  final String deliveryStatus;
  final String paymentStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int user;
  final int address;
}

class OrderProductEntity {
  const OrderProductEntity({
    required this.productId,
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.quantity,
    required this.size,
    required this.color,
  });

  final int productId;
  final String imageUrl;
  final String title;
  final double price;
  final int quantity;
  final String size;
  final String color;
}

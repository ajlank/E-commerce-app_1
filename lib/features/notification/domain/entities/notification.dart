class NotificationEntity {
  const NotificationEntity({
    required this.id,
    required this.title,
    required this.message,
    required this.createdAt,
    required this.isRead,
    required this.updatedAt,
    required this.orderId,
    required this.userId,
  });

  final int id;
  final String title;
  final String message;
  final DateTime createdAt;
  final bool isRead;
  final DateTime updatedAt;
  final int orderId;
  final int userId;
}

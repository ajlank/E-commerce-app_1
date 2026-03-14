import '../../domain/entities/notification.dart';

class NotificationModel extends NotificationEntity {
  NotificationModel({
    required super.id,
    required super.title,
    required super.message,
    required super.createdAt,
    required super.isRead,
    required super.updatedAt,
    required super.orderId,
    required super.userId,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json['id'],
        title: json['title'] ?? '',
        message: json['message'] ?? '',
        createdAt: DateTime.parse(json['created_at']),
        isRead: json['isRead'] ?? false,
        updatedAt: DateTime.parse(json['updated_at']),
        orderId: json['orderId'] ?? 0,
        userId: json['userId'] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'message': message,
        'created_at': createdAt.toIso8601String(),
        'isRead': isRead,
        'updated_at': updatedAt.toIso8601String(),
        'orderId': orderId,
        'userId': userId,
      };
}

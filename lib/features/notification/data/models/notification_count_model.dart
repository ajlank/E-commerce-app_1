import '../../domain/entities/notification_count.dart';

class NotificationCountModel extends NotificationCountEntity {
  NotificationCountModel({required super.unreadCount});

  factory NotificationCountModel.fromJson(Map<String, dynamic> json) =>
      NotificationCountModel(unreadCount: json['unread_count'] ?? 0);

  Map<String, dynamic> toJson() => {'unread_count': unreadCount};
}

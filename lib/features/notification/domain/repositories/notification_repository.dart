import '../entities/notification.dart';
import '../entities/notification_count.dart';

abstract class NotificationRepository {
  Future<List<NotificationEntity>> fetchNotifications();
  Future<NotificationCountEntity> fetchNotificationCount();
  Future<void> markAsRead(int id);
}

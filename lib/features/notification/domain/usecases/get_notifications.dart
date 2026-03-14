import '../entities/notification.dart';
import '../repositories/notification_repository.dart';

class GetNotifications {
  GetNotifications(this.repository);

  final NotificationRepository repository;

  Future<List<NotificationEntity>> call() {
    return repository.fetchNotifications();
  }
}

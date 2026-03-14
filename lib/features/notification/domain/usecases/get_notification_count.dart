import '../entities/notification_count.dart';
import '../repositories/notification_repository.dart';

class GetNotificationCount {
  GetNotificationCount(this.repository);

  final NotificationRepository repository;

  Future<NotificationCountEntity> call() {
    return repository.fetchNotificationCount();
  }
}

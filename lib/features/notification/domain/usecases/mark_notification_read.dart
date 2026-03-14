import '../repositories/notification_repository.dart';

class MarkNotificationRead {
  MarkNotificationRead(this.repository);

  final NotificationRepository repository;

  Future<void> call(int id) {
    return repository.markAsRead(id);
  }
}

import '../../domain/entities/notification.dart';
import '../../domain/entities/notification_count.dart';
import '../../domain/repositories/notification_repository.dart';
import '../datasources/notification_local_data_source.dart';
import '../datasources/notification_remote_data_source.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final NotificationRemoteDataSource remoteDataSource;
  final NotificationLocalDataSource localDataSource;

  @override
  Future<List<NotificationEntity>> fetchNotifications() async {
    final token = localDataSource.readToken();
    if (token == null) {
      return [];
    }
    return remoteDataSource.fetchNotifications(token);
  }

  @override
  Future<NotificationCountEntity> fetchNotificationCount() async {
    final token = localDataSource.readToken();
    if (token == null) {
      return const NotificationCountEntity(unreadCount: 0);
    }
    return remoteDataSource.fetchNotificationCount(token);
  }

  @override
  Future<void> markAsRead(int id) async {
    final token = localDataSource.readToken();
    if (token == null) {
      return;
    }
    await remoteDataSource.markAsRead(token, id);
  }
}

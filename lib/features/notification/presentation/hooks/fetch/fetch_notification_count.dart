import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/datasources/notification_local_data_source.dart';
import '../../../data/datasources/notification_remote_data_source.dart';
import '../../../data/repositories/notification_repository_impl.dart';
import '../../../domain/entities/notification_count.dart';
import '../../../domain/usecases/get_notification_count.dart';
import '../results/notification_count_result.dart';

NotificationCountResult fetchNotificationCount() {
  final count =
      useState<NotificationCountEntity>(const NotificationCountEntity(unreadCount: 0));
  final isLoading = useState(false);
  final error = useState<String?>(null);

  final repository = NotificationRepositoryImpl(
    remoteDataSource: NotificationRemoteDataSource(),
    localDataSource: NotificationLocalDataSource(GetStorage()),
  );
  final getNotificationCount = GetNotificationCount(repository);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      count.value = await getNotificationCount();
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, const []);

  void refetch() {
    isLoading.value = false;
    fetchData();
  }

  return NotificationCountResult(
    notifCount: count.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}

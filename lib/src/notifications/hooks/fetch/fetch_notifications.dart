import 'package:fashionapp/src/notifications/controller/notification_notifier.dart';
import 'package:fashionapp/src/notifications/hooks/result/notification_result.dart';
import 'package:fashionapp/src/notifications/models/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

NotificationResult fetchNotification(BuildContext context) {
  final notification = useState<List<NotificationModel>>([]);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  String? accessToken = GetStorage().read('accessToken');
  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      Uri url = Uri.parse("http://192.168.0.106:8000/api/notifications/me/");

      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        print(response.body);
        notification.value = notificationModelFromJson(response.body);
      }
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    if (accessToken != null) {
      fetchData();
    }

    return;
  }, const []);

  void refetch() {
    isLoading.value = false;
    fetchData();
  }

  context.read<NotificationNotifier>().setRefetchCount(refetch);

  return NotificationResult(
    notifications: notification.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}

// 6:28:32

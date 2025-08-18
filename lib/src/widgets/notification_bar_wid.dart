import 'package:fashionapp/common/widgets/bottom_sheet_login.dart';
import 'package:fashionapp/src/notifications/hooks/fetch/fetch_notification_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

class NotificationBarWid extends HookWidget {
  const NotificationBarWid({super.key});

  @override
  Widget build(BuildContext context) {
    final result = fetchNotificationCount(context);
    final count = result.notifCount.unreadCount;
    final isLoading = result.isLoading;
    final error = result.error;

    if (isLoading) {
      return Text('loading..');
    }
    if (error != null) {
      return Center(child: Text(error.toString()));
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 23.0),
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          icon: Badge(
            label: Text(count.toString()),
            child: Icon(Icons.notifications),
          ),
          onPressed: () {
            if (GetStorage().read('accessToken') == null) {
              showLoginBottomSheet(context);
            } else {
              context.push('/notifications');
            }
          },
        ),
      ),
    );
  }
}

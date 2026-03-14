import 'package:fashionapp/common/widgets/bottom_sheet_login.dart';
import 'package:fashionapp/features/notification/presentation/controllers/notification_notifier.dart';
import 'package:fashionapp/features/notification/presentation/hooks/fetch/fetch_notification_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NotificationBarWid extends HookWidget {
  const NotificationBarWid({super.key});

  @override
  Widget build(BuildContext context) {
    final result = fetchNotificationCount();
    final count = result.notifCount.unreadCount;
    final isLoading = result.isLoading;
    final error = result.error;

    context.read<NotificationNotifier>().setRefetchCount(result.refetch);

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

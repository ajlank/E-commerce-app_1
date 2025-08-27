import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/widgets/empty_screen_widget.dart';
import 'package:fashionapp/common/widgets/shimmers/list_shimmer.dart';
import 'package:fashionapp/src/entrypoint/notification_tile.dart';
import 'package:fashionapp/src/notifications/controller/notification_notifier.dart';
import 'package:fashionapp/src/notifications/hooks/fetch/fetch_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class NotificationViews extends HookWidget {
  const NotificationViews({super.key});

  @override
  Widget build(BuildContext context) {
    final result = fetchNotification(context);
    final notifications = result.notifications;
    final isLoading = result.isLoading;

    if (isLoading) {
      return Scaffold(
        body: Container(
          padding: EdgeInsets.all(8.0),
          color: Colors.white,
          child: ListShimmer(),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(title: Text('Notifications')),
      body: notifications.isEmpty
          ? EmptyScreenWidget()
          : ListView(
              children: List.generate(notifications.length, (i) {
                return NotificationTile(
                  notification: notifications[i],
                  i: i,
                  onUpdate: () {
                    context.read<NotificationNotifier>().setOrderId(
                      notifications[i].orderId,
                    );
                    context.push('/tracking');
                  },
                );
              }),
            ),
    );
  }
}

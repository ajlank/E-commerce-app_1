import 'package:fashionapp/common/widgets/empty_screen_widget.dart';
import 'package:fashionapp/common/widgets/shimmers/list_shimmer.dart';
import 'package:fashionapp/features/notification/presentation/controllers/notification_notifier.dart';
import 'package:fashionapp/features/notification/presentation/hooks/fetch/fetch_notifications.dart';
import 'package:fashionapp/features/notification/presentation/widgets/notification_tile.dart';
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
    final error = result.error;

    context.read<NotificationNotifier>().setRefetchList(result.refetch);

    if (isLoading) {
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.white,
          child: const ListShimmer(),
        ),
      );
    }
    if (error != null) {
      return Scaffold(body: Center(child: Text(error.toString())));
    }
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: notifications.isEmpty
          ? const EmptyScreenWidget()
          : ListView(
              children: List.generate(notifications.length, (i) {
                return NotificationTile(
                  notification: notifications[i],
                  i: i,
                  onUpdate: () {
                    context
                        .read<NotificationNotifier>()
                        .setOrderId(notifications[i].orderId);
                    context.push('/tracking');
                  },
                );
              }),
            ),
    );
  }
}

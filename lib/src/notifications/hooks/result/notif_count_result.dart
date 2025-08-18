import 'package:fashionapp/src/notifications/models/notification_count_model.dart';
import 'package:flutter/material.dart';

class NotificationCountResult {
  final NotificationCount notifCount;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;

  NotificationCountResult({
    required this.notifCount,
    required this.refetch,
    required this.isLoading,
    required this.error,
  });
}

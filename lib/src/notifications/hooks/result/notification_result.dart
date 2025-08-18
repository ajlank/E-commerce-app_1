import 'package:fashionapp/src/notifications/models/notification_model.dart';
import 'package:flutter/material.dart';

class NotificationResult {
  final List<NotificationModel> notifications;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;

  NotificationResult({
    required this.notifications,
    required this.refetch,
    required this.isLoading,
    required this.error,
  });
}

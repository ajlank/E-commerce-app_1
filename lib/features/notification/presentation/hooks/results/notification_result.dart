import 'package:flutter/foundation.dart';
import '../../../domain/entities/notification.dart';

class NotificationResult {
  NotificationResult({
    required this.notifications,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });

  final List<NotificationEntity> notifications;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;
}

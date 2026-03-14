import 'package:flutter/foundation.dart';
import '../../../domain/entities/notification_count.dart';

class NotificationCountResult {
  NotificationCountResult({
    required this.notifCount,
    required this.isLoading,
    required this.error,
    required this.refetch,
  });

  final NotificationCountEntity notifCount;
  final bool isLoading;
  final String? error;
  final VoidCallback refetch;
}

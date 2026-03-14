import 'package:flutter/material.dart';

import '../../domain/usecases/mark_notification_read.dart';

class NotificationNotifier with ChangeNotifier {
  NotificationNotifier({required MarkNotificationRead markNotificationRead})
      : _markNotificationRead = markNotificationRead;

  final MarkNotificationRead _markNotificationRead;

  void Function()? _refetchCount;
  void Function()? _refetchList;

  int _orderId = 0;
  int get orderId => _orderId;

  void setRefetchCount(void Function() r) {
    _refetchCount = r;
  }

  void setRefetchList(void Function() r) {
    _refetchList = r;
  }

  Future<void> setOrderId(int id) async {
    _orderId = id;
    await _markAsRead(id);
    notifyListeners();
  }

  Future<void> _markAsRead(int id) async {
    try {
      await _markNotificationRead(id);
      _refetchList?.call();
      _refetchCount?.call();
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class NotificationNotifier with ChangeNotifier {
  Function? refetchCount;

  void setRefetchCount(Function r) {
    refetchCount = r;
    notifyListeners();
  }

  int _orderId = 0;

  int get orderId => _orderId;

  void setOrderId(int id) {
    _orderId = id;
    markAsRead(id);
    notifyListeners();
  }

  Function? refetch;
  void setRefetch(Function r) {
    refetch = r;
  }

  void markAsRead(int id) async {
    try {
      Uri url = Uri.parse(
        "http://192.168.0.106:8000/api/notifications/update/?id=$id",
      );
      final accessToken = GetStorage().read('accessToken');

      final response = await http.patch(
        url,
        headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        refetch!();
        refetchCount!();
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

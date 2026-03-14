import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/notification_count_model.dart';
import '../models/notification_model.dart';

class NotificationRemoteDataSource {
  NotificationRemoteDataSource({http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  Future<List<NotificationModel>> fetchNotifications(String accessToken) async {
    final url = Uri.parse('http://192.168.0.106:8000/api/notifications/me/');
    final response = await _client.get(
      url,
      headers: {
        'Authorization': 'Token $accessToken',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List<dynamic>;
      return data
          .map((item) => NotificationModel.fromJson(item as Map<String, dynamic>))
          .toList();
    }
    throw Exception('Failed to load notifications');
  }

  Future<NotificationCountModel> fetchNotificationCount(
    String accessToken,
  ) async {
    final url = Uri.parse('http://192.168.0.106:8000/api/notifications/count/');
    final response = await _client.get(
      url,
      headers: {
        'Authorization': 'Token $accessToken',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return NotificationCountModel.fromJson(data);
    }
    throw Exception('Failed to load notification count');
  }

  Future<void> markAsRead(String accessToken, int id) async {
    final url = Uri.parse(
      'http://192.168.0.106:8000/api/notifications/update/?id=$id',
    );
    final response = await _client.patch(
      url,
      headers: {
        'Authorization': 'Token $accessToken',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode != 200) {
      throw Exception('Failed to mark notification as read');
    }
  }
}

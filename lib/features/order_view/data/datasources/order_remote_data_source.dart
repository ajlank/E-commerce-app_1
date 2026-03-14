import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/order_model.dart';

class OrderRemoteDataSource {
  OrderRemoteDataSource({http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  Future<OrderModel> fetchOrder(String accessToken, int id) async {
    final url =
        Uri.parse('http://192.168.0.106:8000/api/orders/single/?id=$id');
    final response = await _client.get(
      url,
      headers: {
        'Authorization': 'Token $accessToken',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      return OrderModel.fromJson(data);
    }
    throw Exception('Failed to load order');
  }
}

import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../models/cart_count_model.dart';
import '../models/cart_model.dart';


class CartRemoteDataSource {
  CartRemoteDataSource({required this.client, required this.storage});

  final http.Client client;
  final GetStorage storage;

  String get _token => storage.read('accessToken');

  Map<String, String> _headers(String token) => {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json',
      };


  Future<List<CartModel>> fetchCart() async {
    final url = Uri.parse('http://192.168.0.106:8000/api/cart/me/');
    final response = await client.get(url, headers: _headers(_token));
    if (response.statusCode == 200) {
      return cartModelFromJson(response.body);
    }
    return [];
  }


  Future<CartCountModel> fetchCartCount() async {
    final url = Uri.parse('http://192.168.0.106:8000/api/cart/count/');
    final response = await client.get(url, headers: _headers(_token));
    if (response.statusCode == 200) {
      return cartCountFromJson(response.body);
    }
    return const CartCountModel(cartCount: 0);
  }


  Future<bool> addToCart(String data) async {
    final url = Uri.parse('http://192.168.0.106:8000/api/cart/add/');
    final response = await client.post(
      url,
      body: data,
      headers: _headers(_token),
    );
    return response.statusCode == 201;
  }

  Future<bool> deleteCartItem(int id) async {
    final url = Uri.parse(
      'http://192.168.0.106:8000/api/cart/delete/?id=$id',
    );
    final response = await client.delete(url, headers: _headers(_token));
    return response.statusCode == 204;
  }

  
  Future<bool> updateCartItem({required int id, required int count}) async {
    final url = Uri.parse(
      'http://192.168.0.106:8000/api/cart/update/?id=$id&count=$count',
    );
    final response = await client.patch(url, headers: _headers(_token));
    return response.statusCode == 200;
  }

  
  Future<String?> createCheckout(String data) async {
    final url = Uri.parse(
      'https://05ea71082003.ngrok-free.app/create-checkout-session',
    );
    final response = await client.post(
      url,
      headers: _headers(_token),
      body: data,
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      return responseData['url'] as String?;
    }
    return null;
  }
}

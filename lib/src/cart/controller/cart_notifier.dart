import 'dart:convert';

import 'package:fashionapp/src/cart/model/cart_model.dart';
import 'package:fashionapp/statemanagement/color_size_notifier.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CartNotifier with ChangeNotifier {
  Function? refetchCount;
  int _qty = 0;

  int get qty => _qty;

  void setRefetchCount(Function r) {
    refetchCount = r;
    notifyListeners();
  }

  void increment() {
    _qty++;
    notifyListeners();
  }

  void decrement() {
    if (_qty > 1) {
      _qty--;
      notifyListeners();
    }
  }

  int? _selectedCart;
  int? get seletedCart => _selectedCart;

  void setSelectedCounter(int id, int q) {
    _selectedCart = id;
    _qty = q;
    notifyListeners();
  }

  void clearCart() {
    _selectedCart = null;
    _qty = 0;
    _selectedCartItemId.clear();
    _selectedCartItem.clear();
    notifyListeners();
  }

  Future<void> add(String data, BuildContext ctx) async {
    String accessToken = GetStorage().read('accessToken');
    try {
      Uri url = Uri.parse("http://192.168.0.106:8000/api/cart/add/");

      final response = await http.post(
        url,
        body: data,
        headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 201) {
        refetchCount!();
        ctx.read<ColorSizeNotifier>().setSize('');
        ctx.read<ColorSizeNotifier>().setColor('');

        ctx.go('/home');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> delete(int id, void Function() refetch) async {
    String accessToken = GetStorage().read('accessToken');
    try {
      Uri url = Uri.parse("http://192.168.0.106:8000/api/cart/delete/?id=$id");

      final response = await http.delete(
        url,
        headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 204) {
        refetch();
        refetchCount!();
        clearCart();
      }
    } catch (e) {}
  }

  Future<void> update(int id, void Function() refetch) async {
    String accessToken = GetStorage().read('accessToken');
    try {
      Uri url = Uri.parse(
        "http://192.168.0.106:8000/api/cart/update/?id=$id&count=$qty",
      );

      final response = await http.patch(
        url,
        headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        refetch();
        refetchCount!();
        clearCart();
      }
    } catch (e) {}
  }

  final List<int> _selectedCartItemId = [];
  List<int> get selectedCartItemId => _selectedCartItemId;

  final List<CartModel> _selectedCartItem = [];
  List<CartModel> get selectedCartItem => _selectedCartItem;
  double totalPrice = 0.0;

  void selectOrDeselct(int id, CartModel cartItem) {
    if (_selectedCartItemId.contains(id)) {
      _selectedCartItemId.remove(id);
      _selectedCartItem.removeWhere((i) => i.id == id);
      totalPrice = calculateTotalPrice(_selectedCartItem);
    } else {
      _selectedCartItemId.add(id);
      _selectedCartItem.add(cartItem);
      totalPrice = calculateTotalPrice(_selectedCartItem);
    }
    notifyListeners();
  }

  double calculateTotalPrice(List<CartModel> items) {
    double tp = 0.0;

    for (var item in items) {
      tp += item.product.price * item.quantity;
    }
    return tp;
  }

  String _paymentUrl = '';
  String get paymentUrl => _paymentUrl;

  void setPaymentUrl(String url) {
    _paymentUrl = url;
    notifyListeners();
  }

  String _success = '';
  String get success => _success;

  void setSuccessUrl(String url) {
    _success = url;
    notifyListeners();
  }

  void createCheckOut(String data) async {
    print(data);

    try {
      Uri url = Uri.parse("hh");

      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: data,
      );
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        setPaymentUrl(responseData['url']);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

// 7:12:47

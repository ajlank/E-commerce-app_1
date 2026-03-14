import 'package:fashionapp/features/cart/domain/entities/cart.dart';
import 'package:fashionapp/features/cart/domain/repositories/cart_repository.dart';
import 'package:fashionapp/features/cart/domain/usecases/add_to_cart.dart';
import 'package:fashionapp/features/cart/domain/usecases/create_checkout.dart';
import 'package:fashionapp/features/cart/domain/usecases/delete_cart_item.dart';
import 'package:fashionapp/features/cart/domain/usecases/update_cart_item.dart';
import 'package:fashionapp/statemanagement/color_size_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CartNotifier with ChangeNotifier {
  CartNotifier({required CartRepository repository})
      : _addToCart = AddToCart(repository),
        _deleteCartItem = DeleteCartItem(repository),
        _updateCartItem = UpdateCartItem(repository),
        _createCheckout = CreateCheckout(repository);

  final AddToCart _addToCart;
  final DeleteCartItem _deleteCartItem;
  final UpdateCartItem _updateCartItem;
  final CreateCheckout _createCheckout;

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
    try {
      final added = await _addToCart(data);
      if (added) {
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
    try {
      final deleted = await _deleteCartItem(id);
      if (deleted) {
        refetch();
        refetchCount!();
        clearCart();
      }
    } catch (e) {}
  }

  Future<void> update(int id, void Function() refetch) async {
    try {
      final updated = await _updateCartItem(id: id, count: _qty);
      if (updated) {
        refetch();
        refetchCount!();
        clearCart();
      }
    } catch (e) {}
  }

  final List<int> _selectedCartItemId = [];
  List<int> get selectedCartItemId => _selectedCartItemId;

  final List<Cart> _selectedCartItem = [];
  List<Cart> get selectedCartItem => _selectedCartItem;
  double totalPrice = 0.0;

  void selectOrDeselct(int id, Cart cartItem) {
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

  double calculateTotalPrice(List<Cart> items) {
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
    try {
      final url = await _createCheckout(data);
      if (url != null) {
        setPaymentUrl(url);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

// 7:12:47

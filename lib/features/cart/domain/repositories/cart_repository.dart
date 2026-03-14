import '../entities/cart.dart';
import '../entities/cart_count.dart';

abstract class CartRepository {
  Future<List<Cart>> fetchCart();
  Future<CartCount> fetchCartCount();
  Future<bool> addToCart(String data);
  Future<bool> deleteCartItem(int id);
  Future<bool> updateCartItem({required int id, required int count});
  Future<String?> createCheckout(String data);
}

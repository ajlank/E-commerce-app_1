import '../../domain/entities/cart.dart';
import '../../domain/entities/cart_count.dart';
import '../../domain/repositories/cart_repository.dart';
import '../datasources/cart_remote_data_source.dart';

class CartRepositoryImpl implements CartRepository {
  CartRepositoryImpl({required this.remoteDataSource});

  final CartRemoteDataSource remoteDataSource;

  @override
  Future<List<Cart>> fetchCart() async {
    final models = await remoteDataSource.fetchCart();
    return List<Cart>.from(models);
  }

  @override
  Future<CartCount> fetchCartCount() async {
    return remoteDataSource.fetchCartCount();
  }

  @override
  Future<bool> addToCart(String data) async {
    return remoteDataSource.addToCart(data);
  }

  @override
  Future<bool> deleteCartItem(int id) async {
    return remoteDataSource.deleteCartItem(id);
  }

  @override
  Future<bool> updateCartItem({required int id, required int count}) async {
    return remoteDataSource.updateCartItem(id: id, count: count);
  }

  @override
  Future<String?> createCheckout(String data) async {
    return remoteDataSource.createCheckout(data);
  }
}

import 'package:fashionapp/features/products/data/models/products_model.dart';
import 'package:http/http.dart' as http;

class WishlistRemoteDataSource {
  WishlistRemoteDataSource({http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  Future<List<Products>> fetchWishlist(String accessToken) async {
    final url = Uri.parse('http://192.168.0.106:8000/api/wishlist/me');
    final response = await _client.get(
      url,
      headers: {
        'Authorization': 'Token $accessToken',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    }
    throw Exception('Failed to load wishlist');
  }

  Future<bool> toggleWishlist(String accessToken, int productId) async {
    final url = Uri.parse(
      'http://192.168.0.106:8000/api/wishlist/toggle/?id=$productId',
    );
    final response = await _client.get(
      url,
      headers: {
        'Authorization': 'Token $accessToken',
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 201) {
      return true;
    }
    if (response.statusCode == 204) {
      return false;
    }
    throw Exception('Failed to toggle wishlist');
  }
}

import 'package:fashionapp/features/products/data/models/products_model.dart';
import 'package:http/http.dart' as http;

class SearchRemoteDataSource {
  SearchRemoteDataSource({http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  Future<List<Products>> searchProducts(String query) async {
    final url = Uri.parse(
      'http://192.168.0.106:8000/api/product/search/?q=$query',
    );
    final response = await _client.get(url);
    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    }
    throw Exception('Failed to search products');
  }
}

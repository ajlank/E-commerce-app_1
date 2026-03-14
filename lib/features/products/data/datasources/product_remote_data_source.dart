import 'package:fashionapp/common/utils/enums.dart';
import 'package:fashionapp/src/model/products_model.dart';
import 'package:http/http.dart' as http;

class ProductRemoteDataSource {
  ProductRemoteDataSource({http.Client? client})
      : _client = client ?? http.Client();

  final http.Client _client;

  Future<List<Products>> fetchRecommendedProducts(int categoryId) async {
    final url = Uri.parse(
      'http://192.168.0.106:8000/api/product/recommendations/?category=$categoryId',
    );
    final response = await _client.get(url);
    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    }
    throw Exception('Failed to load recommended products');
  }

  Future<List<Products>> fetchProductsByType(QueryType queryType) async {
    Uri url;
    switch (queryType) {
      case QueryType.all:
        url = Uri.parse('http://192.168.0.106:8000/api/product/');
        break;
      case QueryType.popular:
        url = Uri.parse('http://192.168.0.106:8000/api/product/popular/');
        break;
      case QueryType.unisex:
      case QueryType.men:
      case QueryType.women:
      case QueryType.kids:
        url = Uri.parse(
          'http://192.168.0.106:8000/api/product/byType/?clothesTypes=${queryType.name}',
        );
        break;
    }
    final response = await _client.get(url);
    if (response.statusCode == 200) {
      return productsFromJson(response.body);
    }
    throw Exception('Failed to load products');
  }
}

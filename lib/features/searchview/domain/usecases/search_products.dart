import 'package:fashionapp/src/model/products_model.dart';
import '../repositories/search_repository.dart';

class SearchProducts {
  SearchProducts(this.repository);

  final SearchRepository repository;

  Future<List<Products>> call(String query) {
    return repository.searchProducts(query);
  }
}

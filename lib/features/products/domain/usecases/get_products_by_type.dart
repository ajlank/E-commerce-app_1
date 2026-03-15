import 'package:fashionapp/common/utils/enums.dart';
import 'package:fashionapp/features/products/data/models/products_model.dart';
import '../repositories/product_repository.dart';

class GetProductsByType {
  GetProductsByType(this.repository);

  final ProductRepository repository;

  Future<List<Products>> call(QueryType queryType) {
    return repository.fetchProductsByType(queryType);
  }
}

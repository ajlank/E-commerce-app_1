import 'package:fashionapp/common/utils/enums.dart';
import 'package:fashionapp/features/products/data/models/products_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../data/datasources/product_remote_data_source.dart';
import '../../../data/repositories/product_repository_impl.dart';
import '../../../domain/usecases/get_products_by_type.dart';
import '../results/products_by_type_result.dart';

ProductsByTypeResult fetchProductsByType(QueryType queryType) {
  final products = useState<List<Products>>([]);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  final repository = ProductRepositoryImpl(ProductRemoteDataSource());
  final getProductsByType = GetProductsByType(repository);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      products.value = await getProductsByType(queryType);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, [queryType.index]);

  void refetch() {
    isLoading.value = false;
    fetchData();
  }

  return ProductsByTypeResult(
    products: products.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}

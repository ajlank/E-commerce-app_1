import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:fashionapp/src/model/products_model.dart';
import '../../../data/datasources/product_remote_data_source.dart';
import '../../../data/repositories/product_repository_impl.dart';
import '../../../domain/usecases/get_recommended_products.dart';
import '../results/recommended_products_result.dart';

RecommendedProductsResult fetchRecommendedProducts(int categoryId) {
  final products = useState<List<Products>>([]);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  final repository =
      ProductRepositoryImpl(ProductRemoteDataSource());
  final getRecommendedProducts = GetRecommendedProducts(repository);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      products.value = await getRecommendedProducts(categoryId);
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  useEffect(() {
    fetchData();
    return null;
  }, const []);

  void refetch() {
    isLoading.value = false;
    fetchData();
  }

  return RecommendedProductsResult(
    products: products.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}

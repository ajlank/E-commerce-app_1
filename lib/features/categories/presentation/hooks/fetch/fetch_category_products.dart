import 'package:fashionapp/features/products/data/models/products_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../data/datasources/category_remote_data_source.dart';
import '../../../data/repositories/category_repository_impl.dart';
import '../../../domain/usecases/get_category_products.dart';
import '../results/category_products_result.dart';

CategoryProductsResult fetchCategoryProducts(int categoryId) {
  final products = useState<List<Products>>([]);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  final repository =
      CategoryRepositoryImpl(CategoryRemoteDataSource());
  final getCategoryProducts = GetCategoryProducts(repository);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      products.value = await getCategoryProducts(categoryId);
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

  return CategoryProductsResult(
    products: products.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}

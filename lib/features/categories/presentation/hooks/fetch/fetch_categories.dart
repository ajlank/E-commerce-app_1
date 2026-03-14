import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../data/datasources/category_remote_data_source.dart';
import '../../../data/repositories/category_repository_impl.dart';
import '../../../domain/entities/category.dart';
import '../../../domain/usecases/get_categories.dart';
import '../results/categories_result.dart';

CategoriesResult fetchCategories() {
  final categories = useState<List<Category>>([]);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  final repository =
      CategoryRepositoryImpl(CategoryRemoteDataSource());
  final getCategories = GetCategories(repository);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      categories.value = await getCategories();
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

  return CategoriesResult(
    categories: categories.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}

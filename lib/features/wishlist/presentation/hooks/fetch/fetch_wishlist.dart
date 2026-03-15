import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/datasources/wishlist_local_data_source.dart';
import 'package:fashionapp/features/products/data/models/products_model.dart';
import '../../../data/datasources/wishlist_remote_data_source.dart';
import '../../../data/repositories/wishlist_repository_impl.dart';
import '../../../domain/usecases/get_wishlist.dart';
import '../results/wishlist_result.dart';

WishlistResult fetchWishList() {
  final products = useState<List<Products>>([]);
  final isLoading = useState(false);
  final error = useState<String?>(null);

  final repository = WishlistRepositoryImpl(
    remoteDataSource: WishlistRemoteDataSource(),
    localDataSource: WishlistLocalDataSource(GetStorage()),
  );
  final getWishlist = GetWishlist(repository);

  Future<void> fetchData() async {
    isLoading.value = true;
    try {
      products.value = await getWishlist();
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

  return WishlistResult(
    products: products.value,
    isLoading: isLoading.value,
    error: error.value,
    refetch: refetch,
  );
}

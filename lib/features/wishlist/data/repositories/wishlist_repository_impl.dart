import 'package:fashionapp/features/products/data/models/products_model.dart';
import '../../domain/repositories/wishlist_repository.dart';
import '../datasources/wishlist_local_data_source.dart';
import '../datasources/wishlist_remote_data_source.dart';

class WishlistRepositoryImpl implements WishlistRepository {
  WishlistRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  final WishlistRemoteDataSource remoteDataSource;
  final WishlistLocalDataSource localDataSource;

  @override
  Future<List<Products>> fetchWishlist() async {
    final token = localDataSource.readToken();
    if (token == null) {
      return [];
    }
    return remoteDataSource.fetchWishlist(token);
  }

  @override
  Future<void> toggleWishlist(int productId) async {
    final token = localDataSource.readToken();
    if (token == null) {
      return;
    }
    await remoteDataSource.toggleWishlist(token, productId);
    localDataSource.toggleWishlistId(productId);
  }

  @override
  List<int> getWishlistIds() {
    return localDataSource.readWishlistIds();
  }
}

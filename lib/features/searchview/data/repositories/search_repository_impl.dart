import 'package:fashionapp/src/model/products_model.dart';
import '../../domain/repositories/search_repository.dart';
import '../datasources/search_remote_data_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl(this.remoteDataSource);

  final SearchRemoteDataSource remoteDataSource;

  @override
  Future<List<Products>> searchProducts(String query) {
    return remoteDataSource.searchProducts(query);
  }
}

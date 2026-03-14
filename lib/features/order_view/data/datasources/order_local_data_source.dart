import 'package:get_storage/get_storage.dart';

class OrderLocalDataSource {
  OrderLocalDataSource(this.storage);

  final GetStorage storage;

  String? readToken() {
    return storage.read('accessToken');
  }
}

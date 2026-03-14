import 'package:get_storage/get_storage.dart';

class SplashLocalDataSource {
  SplashLocalDataSource(this.storage);

  final GetStorage storage;

  String? readFirstOpen() {
    return storage.read('firstOpen');
  }
}

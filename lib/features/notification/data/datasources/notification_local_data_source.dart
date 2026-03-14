import 'package:get_storage/get_storage.dart';

class NotificationLocalDataSource {
  NotificationLocalDataSource(this.storage);

  final GetStorage storage;

  String? readToken() {
    return storage.read('accessToken');
  }
}

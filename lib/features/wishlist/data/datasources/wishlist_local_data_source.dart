import 'dart:convert';

import 'package:get_storage/get_storage.dart';

class WishlistLocalDataSource {
  WishlistLocalDataSource(this.storage);

  final GetStorage storage;

  String? readToken() {
    return storage.read('accessToken');
  }

  List<int> readWishlistIds() {
    final token = readToken();
    if (token == null) {
      return [];
    }
    final data = storage.read('${token}wishlist');
    if (data == null) {
      return [];
    }
    final decoded = jsonDecode(data);
    if (decoded is List) {
      return decoded.map((e) => e as int).toList();
    }
    return [];
  }

  List<int> toggleWishlistId(int id) {
    final token = readToken();
    if (token == null) {
      return [];
    }
    final list = readWishlistIds();
    if (list.contains(id)) {
      list.removeWhere((e) => e == id);
    } else {
      list.add(id);
    }
    storage.write('${token}wishlist', jsonEncode(list));
    return list;
  }
}

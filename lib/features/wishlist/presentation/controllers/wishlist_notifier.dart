import 'package:flutter/material.dart';

import '../../domain/usecases/get_wishlist_ids.dart';
import '../../domain/usecases/toggle_wishlist.dart';

class WishlistNotifier with ChangeNotifier {
  WishlistNotifier({
    required GetWishlistIds getWishlistIds,
    required ToggleWishlist toggleWishlist,
  })  : _getWishlistIds = getWishlistIds,
        _toggleWishlist = toggleWishlist {
    _wishList = _getWishlistIds();
  }

  final GetWishlistIds _getWishlistIds;
  final ToggleWishlist _toggleWishlist;

  String? error;

  List<int> _wishList = [];
  List<int> get wishList => _wishList;

  void setWishList(List<int> w) {
    _wishList = w;
    notifyListeners();
  }

  Future<void> removeOrAddWishList(int id, Function refetch) async {
    try {
      await _toggleWishlist(id);
      setWishList(_getWishlistIds());
      refetch();
    } catch (e) {
      error = e.toString();
      notifyListeners();
    }
  }
}

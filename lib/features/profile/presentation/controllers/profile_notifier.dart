import 'package:fashionapp/features/auth/domain/entities/user.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/get_profile_user.dart';
import '../../domain/usecases/has_access_token.dart';
import '../../domain/usecases/logout.dart';

class ProfileNotifier with ChangeNotifier {
  ProfileNotifier({
    required GetProfileUser getProfileUser,
    required HasAccessToken hasAccessToken,
    required Logout logout,
  })  : _getProfileUser = getProfileUser,
        _hasAccessToken = hasAccessToken,
        _logout = logout {
    _load();
  }

  final GetProfileUser _getProfileUser;
  final HasAccessToken _hasAccessToken;
  final Logout _logout;

  User? _user;
  bool _isLoggedIn = false;

  User? get user => _user;
  bool get isLoggedIn => _isLoggedIn;

  void _load() {
    _isLoggedIn = _hasAccessToken();
    _user = _getProfileUser();
  }

  Future<void> logout() async {
    await _logout();
    _isLoggedIn = false;
    _user = null;
    notifyListeners();
  }
}

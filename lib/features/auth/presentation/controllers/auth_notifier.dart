import 'package:fashionapp/features/auth/domain/entities/login.dart';
import 'package:fashionapp/features/auth/domain/entities/register.dart';
import 'package:fashionapp/features/auth/domain/entities/user.dart';
import 'package:fashionapp/features/auth/domain/repositories/auth_repository.dart';
import 'package:fashionapp/features/auth/domain/usecases/fetch_me.dart';
import 'package:fashionapp/features/auth/domain/usecases/get_cached_user.dart';
import 'package:fashionapp/features/auth/domain/usecases/login_user.dart';
import 'package:fashionapp/features/auth/domain/usecases/register_user.dart';
import 'package:fashionapp/statemanagement/navigation_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AuthNotifier with ChangeNotifier {
  AuthNotifier({required AuthRepository repository})
      : _loginUser = LoginUser(repository),
        _registerUser = RegisterUser(repository),
        _fetchMe = FetchMe(repository),
        _getCachedUser = GetCachedUser(repository),
        _repository = repository;

  final LoginUser _loginUser;
  final RegisterUser _registerUser;
  final FetchMe _fetchMe;
  final GetCachedUser _getCachedUser;
  final AuthRepository _repository;

  bool _isloading = false;

  bool get isloading => _isloading;

  void _setLoading(bool value) {
    _isloading = value;
    notifyListeners();
  }

  Future<void> loginFunc(Login data, BuildContext ctx) async {
    _setLoading(true);
    try {
      final token = await _loginUser(data);
      await _repository.cacheToken(token.authToken);
      await _fetchAndCacheUser(token.authToken, ctx);
    } catch (e) {
      //showerror popup
    } finally {
      _setLoading(false);
    }
  }

  Future<void> registerFunc(Register data, BuildContext ctx) async {
    _setLoading(true);
    try {
      final token = await _registerUser(data);
      await _repository.cacheToken(token.authToken);
    } catch (e) {
      //showerror popup
    } finally {
      _setLoading(false);
    }
  }

  Future<void> _fetchAndCacheUser(String accessToken, BuildContext ctx) async {
    try {
      final user = await _fetchMe(accessToken);
      await _repository.cacheUser(accessToken, user);
      ctx.go('/home');
      ctx.read<NavigationPageNotifier>().setIndex = 0;
    } catch (e) {
      //showerror popup
    }
  }

  User? userData() {
    return _getCachedUser();
  }
}

//10:45:52

import 'package:fashionapp/features/products/data/models/products_model.dart';
import 'package:flutter/material.dart';

import '../../domain/usecases/search_products.dart';

class SearchNotifier with ChangeNotifier {
  SearchNotifier({required SearchProducts searchProducts})
      : _searchProducts = searchProducts;

  final SearchProducts _searchProducts;

  bool _isLoading = false;
  List<Products> _results = [];
  String _error = '';
  String _searchKey = '';

  bool get isLoading => _isLoading;
  List<Products> get getResults => _results;
  String get getError => _error;
  String get searchKey => _searchKey;

  void setLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  void setResults(List<Products> p) {
    _results = p;
    notifyListeners();
  }

  void clear() {
    _results = [];
    notifyListeners();
  }

  void setError(String e) {
    _error = e;
    notifyListeners();
  }

  void setSearchKey(String k) {
    _searchKey = k;
    notifyListeners();
  }

  Future<void> searchFunction(String searchKey) async {
    setLoading(true);
    setSearchKey(searchKey);

    try {
      final data = await _searchProducts(searchKey);
      setResults(data);
    } catch (e) {
      setError(e.toString());
    } finally {
      setLoading(false);
    }
  }
}

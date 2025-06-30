import 'package:flutter/material.dart';

class NavigationPageNotifier with ChangeNotifier{
  int _index=0;

  int get index=>_index;

  set setIndex(int val){
      _index=val;
      notifyListeners();
  }
}
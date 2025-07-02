import 'package:flutter/foundation.dart';

class CategoryNotifier with ChangeNotifier{
  
  int _id=0;
  String category='';

  void setCategoryAndId(int id, String c){
   _id=id;
   category=c;
   notifyListeners();
  }

  String get getCategory=>category;
  int get getId=>_id;
}

import 'package:flutter/widgets.dart';

class OnboardChangeNotifier with ChangeNotifier{
  int _selectedPage=0;

 int get selectedPage=>_selectedPage;

 set setSelectedPage(int page){
  _selectedPage=page;
  notifyListeners();
 }



}

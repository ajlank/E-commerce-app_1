import 'package:flutter/material.dart';

class ColorSizeNotifier with ChangeNotifier{

 String _color='';
 String _size='';
 
 String get color =>_color;
 String get size =>_size;

 void setColor(String c){
  if(_color==c){
   _color='';
  }else{
    _color=c;
  }
  notifyListeners();
 }

 void setSize(String s){
  if(_size==s){
    _size='';
  }else{
    _size=s;
  }
  notifyListeners();
 }

}
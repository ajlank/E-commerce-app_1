import 'package:fashionapp/src/model/products_model.dart';
import 'package:flutter/material.dart';

class ProductNotifier with ChangeNotifier{
 Products? product;
 
 void setProduct(Products p){
  product=p;
  notifyListeners();
 }

}
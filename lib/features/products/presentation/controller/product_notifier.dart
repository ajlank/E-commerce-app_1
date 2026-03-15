import 'package:fashionapp/features/products/data/models/products_model.dart';
import 'package:flutter/material.dart';

class ProductNotifier with ChangeNotifier{
 Products? product;
 bool _description=false;
 
 void setProduct(Products p){
  product=p;
  notifyListeners();
 }
 bool get description=>_description;
 void setDescription(){
  _description=!_description;
  notifyListeners();
 }
 void resetDescription(){
  _description=false;
  notifyListeners();
 }

}
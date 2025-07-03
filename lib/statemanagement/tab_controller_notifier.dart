import 'package:fashionapp/common/utils/enums.dart';
import 'package:flutter/material.dart';

class TabControllerNotifier with ChangeNotifier{
  QueryType queryType=QueryType.all;
  String _index="All";
  String get index=>_index;

  void setIndex(String index){
    _index=index;

    switch(index){
      
      case 'All':
      break;
      
      case 'Popular':
      break;
      
      case 'Unisex':
      break;

      case 'Men':
      break;

      case 'Women':
      break;

      case 'Kids':
      break;
      
      default:

    }
   //
  }
 
  void setQueryType(QueryType q){
    queryType=q;
  }

}

// 5:36:31
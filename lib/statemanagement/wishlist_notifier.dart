import 'dart:convert';

import 'package:fashionapp/common/services/storage.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class WishlistNotifier with ChangeNotifier{
   
   String? error;
   void setError(String e){
    error=e;
    notifyListeners();
   }
  void removeOrAddWishList(int id, Function refetch) async {
    
    try{
     Uri url=Uri.parse("http://192.168.0.106:8000/api/wishlist/toggle/?id=$id");
      final accessToken=GetStorage().read('accessToken');

     final response=await http.get(url, headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },);
       
       if(response.statusCode==201){
         //set the id to a list in the local storage
         setToList(id);
         //refetch data
         refetch();
       }else if(response.statusCode==204){
        //remove from localstorage
        setToList(id);
        //refetch data
       refetch();
       }
    }catch(e){
      error=e.toString();
      
    }
  }

  List _wishList=[];
  List get wishList=>_wishList;
 
   void setWishList(List w){
    _wishList.clear();
     _wishList=w;
     notifyListeners();
   }

   void setToList(int v){
    String? accessToken=GetStorage().read('accessToken');
    String? wishList=GetStorage().read('${accessToken}wishlist');

    if(wishList==null){
      List wishlist=[];
      wishlist.add(v);
      setWishList(wishlist);
      GetStorage().write('${accessToken}wishlist', jsonEncode(wishlist));
    }else{
      List w=jsonDecode(wishList);
      if(w.contains(v)){
        w.removeWhere((e)=>e==v);
        setWishList(w);
         GetStorage().write('${accessToken}wishlist', jsonEncode(w));
      }else if(!w.contains(v)){
          w.add(v);
          setWishList(w);
          GetStorage().write('${accessToken}wishlist', jsonEncode(w));
      }
    }

   }
}
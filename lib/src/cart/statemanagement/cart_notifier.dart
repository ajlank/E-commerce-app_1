import 'package:fashionapp/src/cart/model/cart_count_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CartNotifier with ChangeNotifier{
  Function? refetchCount;  
  int _qty=0;

  int get qty=>_qty;
  
  void setRefetchCount(Function r){
    refetchCount=r;
    notifyListeners();
  }

   void increment(){
    _qty++;
    notifyListeners();
   }
   void decrement(){
      if(_qty>1){
        _qty--;
      notifyListeners();
      }

   }
   
  int? _selectedCart;
  int? get seletedCart=>_selectedCart;
  
  void setSelectedCounter(int id, int q){
    _selectedCart=id;
    _qty=q;
    notifyListeners();  
  }
 
 void clearCart(){
  _selectedCart=null;
    _qty=0;
    notifyListeners();  
 }
Future<void>add(String data, BuildContext ctx)async{
  String accessToken=GetStorage().read('accessToken');
   try{
     Uri url=Uri.parse("http://192.168.0.106:8000/api/cart/add/");
    
     final response=await http.post(url,body: data, 
     headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },);
      if(response.statusCode==201){
           refetchCount!();
           
           ctx.go('/home');
      }
   }catch(e){
      print(e.toString());
   }
}
 Future<void>delete(int id, void Function() refetch)async{ 
  String accessToken=GetStorage().read('accessToken');
   try{
     Uri url=Uri.parse("http://192.168.0.106:8000/api/cart/delete/?id=$id");
    
     final response=await http.delete(url, headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },);
      if(response.statusCode==204){
        refetch();
        clearCart();
      }
   }catch(e){
      print(e.toString());
   }}

 Future<void>update(int id, void Function() refetch)async{
    String accessToken=GetStorage().read('accessToken');
   try{
     Uri url=Uri.parse("http://192.168.0.106:8000/api/cart/update/?id=$id&count=$qty");
    
     final response=await http.patch(url, headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },);
      if(response.statusCode==200){
        refetch();
        clearCart();
      }
   }catch(e){
      print(e.toString());
   }

 }

}
import 'package:fashionapp/src/cart/model/cart_count_model.dart';
import 'package:fashionapp/src/cart/hooks/fetch_cart_count_result.dart';
import 'package:fashionapp/src/cart/controller/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

FetchCartCountResult fetchCartCount(BuildContext context){
   final initialCount=CartCount(cartCount: 0);
   final count=useState<CartCount>(initialCount);
   final isLoading=useState(false);
   final error=useState<String?>(null);

String? accessToken= GetStorage().read('accessToken');
  Future<void>fetchData()async{
     isLoading.value=true;
    try{
     Uri url=Uri.parse("http://192.168.0.106:8000/api/cart/count/");
      
     final response= await http.get(url,
        headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },
     );
     print('before');
     print(response.statusCode);
     if(response.statusCode==200){
         print(response.body);
       count.value=cartCountFromJson(response.body);
      
     }
    
    }catch(e){
      error.value = e.toString();
 
    }finally{
      isLoading.value=false;
    }
  }

 useEffect((){
  if(accessToken!=null){
  fetchData();
  }
  
  return;
 },const []);

 void refetch(){
   isLoading.value=false;
   fetchData();
 }
 context.read<CartNotifier>().setRefetchCount(refetch);

   return FetchCartCountResult(
    count: count.value, 
    isLoading: isLoading.value, 
    error: error.value, 
    refetch: refetch);


}

// 6:28:32
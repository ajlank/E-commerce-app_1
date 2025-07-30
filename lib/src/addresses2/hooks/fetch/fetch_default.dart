import 'package:fashionapp/src/addresses2/hooks/results/default_result.dart';
import 'package:fashionapp/src/addresses2/models/addresses_model2.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

FetchDefaultAddress2 fetchDefaultAdd2(){
   
   final address=useState<AddressModel?>(null);
   final isLoading=useState(false);
   final error=useState<String?>(null);
String? accessToken= GetStorage().read('accessToken');
  Future<void>fetchData()async{
     isLoading.value=true;
      
    try{
     Uri url=Uri.parse("http://192.168.0.106:8000/api/address/me/");
     final response= await http.get(url,
      headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },
     );
     
     if(response.statusCode==200){
       address.value=addressDefaultFromJson(response.body);
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
  return null;
 },const []);

 void refetch(){
   isLoading.value=false;
   fetchData();
 }
   return FetchDefaultAddress2(
   address: address.value, 
    isLoading: isLoading.value, 
    error: error.value, 
    refetch: refetch);


}
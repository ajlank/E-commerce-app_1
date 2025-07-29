import 'package:fashionapp/src/address/hooks/fetch_address_result.dart';
import 'package:fashionapp/src/address/model/address_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

FetchAddressResult fetchAddress(){
   
   final address=useState<List<AddressModel>>([]);
   final isLoading=useState(false);
   final error=useState<String?>(null);

  String? accessToken= GetStorage().read('accessToken');
  Future<void>fetchData()async{
     isLoading.value=true;
    try{
     Uri url=Uri.parse("http://192.168.0.106:8000/api/address/addresslist/");
     final response= await http.get(url,
      headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },
     );
  
     if(response.statusCode==200){
        print('confirmed');
        print(response.body);
       address.value=addressListFromJson(response.body);
     }
    
    }catch(e){
      error.value = e.toString();
    print(e);
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
   return FetchAddressResult(
    address: address.value, 
    isLoading: isLoading.value, 
    error: error.value, 
    refetch: refetch);


}
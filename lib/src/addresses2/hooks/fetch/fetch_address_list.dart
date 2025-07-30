import 'package:fashionapp/src/addresses2/hooks/results/ad_list_result.dart';
import 'package:fashionapp/src/addresses2/models/addresses_model2.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

FetchAddressListResult fetchAddressList2(){
   
   final address=useState<List<AddressModel>>([]);
   final isLoading=useState(false);
   final error=useState<String?>(null);

  Future<void>fetchData()async{
     isLoading.value=true;
     String? accessToken= GetStorage().read('accessToken');
    try{
     Uri url=Uri.parse("http://192.168.0.106:8000/api/address/addresslist");
     final response= await http.get(url,
     headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },
     );
     if(response.statusCode==200){
       address.value=addressListFromJson(response.body);
     }
    
    }catch(e){
      error.value = e.toString();
 
    }finally{
      isLoading.value=false;
    }
  }

 useEffect((){
  fetchData();
  return null;
 },const []);

 void refetch(){
   isLoading.value=false;
   fetchData();
 }
   return FetchAddressListResult(
    address: address.value, 
    isLoading: isLoading.value, 
    error: error.value, 
    refetch: refetch);


}
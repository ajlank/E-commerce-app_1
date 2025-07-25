import 'package:fashionapp/hooks/results/fetch_product_by_categories_result.dart';
import 'package:fashionapp/src/model/products_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

FetchProductByCategoriesResult fetchWishList(){
   
   final products=useState<List<Products>>([]);
   final isLoading=useState(false);
   final error=useState<String?>(null);

  Future<void>fetchData()async{
     isLoading.value=true;
    try{
     Uri url=Uri.parse("http://192.168.0.106:8000/api/wishlist/me");
     String? accessToken= GetStorage().read('accessToken');
     final response= await http.get(url,
      headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },
     );

     if(response.statusCode==200){
       products.value=productsFromJson(response.body);
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
   return FetchProductByCategoriesResult(
    products: products.value, 
    isLoading: isLoading.value, 
    error: error.value, 
    refetch: refetch);


}
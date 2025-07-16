import 'package:fashionapp/hooks/results/fetch_product_by_categories_result.dart';
import 'package:fashionapp/src/model/products_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchProductByCategoriesResult fetchProductByCategoriesResult(int categoryId){
   
   final products=useState<List<Products>>([]);
   final isLoading=useState(false);
   final error=useState<String?>(null);

  Future<void>fetchData()async{
    print(categoryId);
     isLoading.value=true;
    try{
     Uri url=Uri.parse("http://192.168.0.106:8000/api/product/category/?category=$categoryId");
     final response= await http.get(url);
     print("Response Body: ${response.body}");
     print("Status Code: ${response.statusCode}");
     if(response.statusCode==200){
       products.value=productsFromJson(response.body);
       print(response.body);
     }
    
    }catch(e){
      error.value = e.toString();
  print("Error parsing JSON: $e");
 
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
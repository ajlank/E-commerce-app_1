import 'package:fashionapp/common/utils/enums.dart';
import 'package:fashionapp/hooks/results/fetch_products_by_type_results.dart';
import 'package:fashionapp/src/model/products_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchProductsByTypeResults fetchProductsByTypeResults(QueryType queryType){

  final products=useState<List<Products>>([]); 
  final isLoading=useState(false);
  final error=useState<String?>(null);

   Future<void>fetchData()async{
    isLoading.value=true;
    Uri url;
    try{
      switch(queryType){
        case QueryType.all:
         url=Uri.parse("http://192.168.0.106:8000/api/product/");
          break;
        case QueryType.popular:
         url=Uri.parse("http://192.168.0.106:8000/api/product/popular/");
         break;
        case QueryType.unisex:
         url=Uri.parse("http://192.168.0.106:8000/api/product/byType/?clothesTypes=${queryType.name}");
          break;
        case QueryType.men:
         url=Uri.parse("http://192.168.0.106:8000/api/product/byType/?clothesTypes=${queryType.name}");
         break;
        case QueryType.women:
              url=Uri.parse("http://192.168.0.106:8000/api/product/byType/?clothesTypes=${queryType.name}");
          break;
        case QueryType.kids:
           url=Uri.parse("http://192.168.0.106:8000/api/product/byType/?clothesTypes=${queryType.name}"); 
           break;

      }
      final response=await http.get(url);

      if(response.statusCode==200){
        products.value=productsFromJson(response.body);
        
      }
    }catch(e){
      error.value=e.toString();
      print(e.toString());
    }finally{
      isLoading.value=false;
    }
   }
 
 useEffect((){
  fetchData();
  return null;
 },[queryType.index]);

 void refetch(){
  isLoading.value=false;
  fetchData();
 }
  return FetchProductsByTypeResults(
      refetch: refetch,
      products: products.value,
      isLoading: isLoading.value,
      error: error.value);
}
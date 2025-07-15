import 'package:fashionapp/hooks/results/fetch_categories_result.dart';
import 'package:fashionapp/src/model/categories_model.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:http/http.dart' as http;

FetchCategories fetchCategories(){
  
 final categories=useState<List<Categories>>([]);
 final isLoading=useState(false);
 final error=useState<String?>(null);

  Future<void>fetchData()async{
    isLoading.value=true;
    try{
       final url= Uri.parse("http://192.168.0.106:8000/api/product/categories/");
       final response= await http.get(url);

      if(response.statusCode==200){
        categories.value= categoriesFromJson(response.body);
      }
    }catch(e){
       error.value=e.toString();
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

  return FetchCategories(categories: categories.value,
   isLoading: isLoading.value, 
   error: error.value,
    refetch: refetch);

}

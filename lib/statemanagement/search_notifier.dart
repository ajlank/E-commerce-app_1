import 'package:fashionapp/src/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SearchNotifier with ChangeNotifier{

   bool _isLoading=false;
   List<Products>_results=[];
  
   void setLoading(bool v){
    _isLoading=v;
    notifyListeners();
   }
  
  void setResults(List<Products> p){
      _results=p;
      notifyListeners();
  }
   bool get isLoading=>_isLoading;
   List<Products> get getResults=>_results;


   void clear(){
    _results=[];
    notifyListeners();
   }

 String error='';

   void setError(String e){
    error=e;
    notifyListeners();
   }
   String get getError=>error;

   String _searchKey='';

   void setSearchKey(String k){
    _searchKey=k;
    notifyListeners();
   }
   String get searchKey=>_searchKey;


   void searchFunction(String searchKey)async{
    setLoading(true);
    setSearchKey(searchKey);
    Uri url=Uri.parse("http://192.168.0.106:8000/api/product/search/?q=$searchKey");

    try{
     final response=await http.get(url);
     
     if(response.statusCode==200){
      var data=productsFromJson(response.body);
       setResults(data);
       setLoading(false);
     }

    }catch(e){
      setError(e.toString());
    }
   }
}
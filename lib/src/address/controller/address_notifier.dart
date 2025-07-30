import 'package:fashionapp/common/models/api_error_model.dart';
import 'package:fashionapp/src/addresses2/models/addresses_model2.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AddressNotifier with ChangeNotifier{
 
 AddressModel? address;
 
 void setAddress(AddressModel a){
   address=a;
   notifyListeners();
 }

  void clearAddress(){
  address=null;
  notifyListeners();
  }


 List<String>addressTypes=['Home','School','Office'];
 String _addressType='';

 void setAddressType(String type){
   _addressType=type;
   notifyListeners();
 }

 String get addressType=>_addressType;

  void clearAddressTyoe(){
  _addressType='';
  notifyListeners();
  }
  bool _defaultToggle=false;

  void setDefaultToggle(bool d){
    _defaultToggle=d;
    notifyListeners();
  }
  bool get defaultToggle=>_defaultToggle;
  
  void clearDefaultToggle(){
    _defaultToggle=false;
    notifyListeners();
  }

  void setAsDefault(int id, Function refetch)async {
    String accessToken=GetStorage().read('accessToken');
   try{
     Uri url=Uri.parse("http://192.168.0.106:8000/api/address/default/?id=$id");
    
     final response=await http.patch(url,
     headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },);
        
      if(response.statusCode==201){
           refetch();
      }else if(response.statusCode==404 || response.statusCode==400){
        final data=apiErrorFromJson(response.body);
        // showErrorPopup(context, errorMessage, title, removeCancel)
        print('error $data');
      }
   }catch(e){
      print(e.toString());

   }
  }


void deleteAddress(int id, Function refetch)async {
    String accessToken=GetStorage().read('accessToken');
   try{
     Uri url=Uri.parse("http://192.168.0.106:8000/api/address/delete/?id=$id");
    
     final response=await http.delete(url,
          headers: {
            'Authorization': 'Token $accessToken',
            'Content-Type': 'application/json',
          },
        );
      if(response.statusCode==200){
           refetch();
      }else if(response.statusCode==404 || response.statusCode==400){
        final data=apiErrorFromJson(response.body);
        print('error $data');
      }
   }catch(e){
      print(e.toString());
   }
  }
}
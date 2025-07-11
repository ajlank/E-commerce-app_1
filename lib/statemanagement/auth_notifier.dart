import 'package:fashionapp/src/auth/models/auth_token_model.dart';
import 'package:fashionapp/src/auth/models/user_model.dart';
import 'package:fashionapp/statemanagement/navigation_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AuthNotifier with ChangeNotifier {
  bool _isloading = false;

  bool get isloading => _isloading;

  void setLoading() {
    _isloading = !_isloading;
    notifyListeners();
  }

  void loginFunc(String data, BuildContext ctx) async {
    setLoading();
    try {
      var url = Uri.parse('http://192.168.0.106:8000/auth/token/login/');
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: data,
      );
      if(response.statusCode==200){
        String accessToken=authTokenFromJson(response.body).authToken;
        getUser(accessToken, ctx);
        GetStorage().write('accessToken', accessToken);
        setLoading();
      
        //todo//get user info
        //todo//get user extras
      }
    } catch (e) {
      setLoading();
      //showerror popup
    }
  }

  void registerFunc(String data, BuildContext ctx) async {
     setLoading();
    try {
      var url = Uri.parse('http://192.168.0.106:8000/auth/users/');

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: data,
      );

      if(response.statusCode==201){
        String accessToken=authTokenFromJson(response.body).authToken;
        GetStorage().write('accessToken', accessToken);
 
        //todo//get user info
        //todo//get user extras
      }else if(response.statusCode==400){
         setLoading(); 
        //show popup error
      }
    } catch (e) {
      setLoading();
      print(e);
      //showerror popup
    }
  }

void getUser(String accessToken, BuildContext ctx)async{
    setLoading();
    try {
      var url = Uri.parse('http://192.168.0.106:8000/auth/users/me/');

      var response = await http.get(
        url,
        headers: {
          'Authorization': 'Token $accessToken',
          'Content-Type': 'application/json',
        },
      );

      if(response.statusCode==200){
       
        GetStorage().write(accessToken, response.body);
        ctx.go('/home');
        ctx.read<NavigationPageNotifier>().setIndex=0;

        //todo//get user info
        //todo//get user extras
      }else if(response.statusCode==400){
         setLoading(); 
        //show popup error
      }
    } catch (e) {
      setLoading();
      print(e);
      //showerror popup
    }
  }

  UserModel? userData(){
    final accessToken=GetStorage().read('accessToken');

    if(accessToken!=null){
      final data=GetStorage().read(accessToken);
      
      if(data!=null){
        return userModelFromJson(data);
      }
    }
    return null;
  }
}

//10:45:52
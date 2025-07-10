import 'package:fashionapp/src/auth/models/auth_token_model.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AuthNotifier with ChangeNotifier {
  bool _isloading = false;

  bool get isloading => _isloading;

  void setLoading() {
    _isloading = !_isloading;
    notifyListeners();
  }

  void loginFunc(String data) async {
    setLoading();
    try {
      var url = Uri.parse('http://127.0.0.1:8000/auth/token/login/');

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: data,
      );

      if(response.statusCode==200){
        String accessToken=authTokenFromJson(response.body).authToken;
        GetStorage().write('accessToken', accessToken);
        setLoading();
        print(accessToken);

        //todo//get user info
        //todo//get user extras
      }
    } catch (e) {
      setLoading();
      //showerror popup
    }
  }

  void registerFunc(String data) async {
     setLoading();
    try {
      var url = Uri.parse('http://127.0.0.1:8000/auth/users/');

      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: data,
      );

      if(response.statusCode==201){
        String accessToken=authTokenFromJson(response.body).authToken;
        GetStorage().write('accessToken', accessToken);
        setLoading();

        //todo//get user info
        //todo//get user extras
      }else if(response.statusCode==400){
         setLoading(); 
        //show popup error
      }
    } catch (e) {
      setLoading();
      //showerror popup
    }
  }

  void getUser(String accessToken)async{}
}

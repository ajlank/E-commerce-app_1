import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/src/auth/models/login_model.dart';
import 'package:fashionapp/statemanagement/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class LoginShopView extends StatefulWidget {
  const LoginShopView({super.key});

  @override
  State<LoginShopView> createState() => _LoginShopViewState();
}

class _LoginShopViewState extends State<LoginShopView> {

  late final TextEditingController _username;
  late final TextEditingController _password;

  @override
  void initState() {
    _username=TextEditingController();
    _password=TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _password.dispose();
    context.pop();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        leading: IconButton(onPressed: (){
          context.pop();
        }, icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
              Text('Easy Fashion', style: appStyle(22,Colors.brown,FontWeight.bold),),
           ],
         ),
         SizedBox(
          height: 5,
         ),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const Text("Hi, Welcome back. You've been missed"),
           ],
         ),
           Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: _username,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: 'username',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50)
            )   
            ),
            
          ),
        ),
           Padding(
          padding: const EdgeInsets.all(15.0),
          child: TextField(
            controller: _password,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.lock),
              hintText: 'password',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50)
            )   
            ),
            
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            
            decoration: BoxDecoration( 
             color: Colors.brown,
             borderRadius: BorderRadius.circular(22)
            ),
            child:TextButton(onPressed: (){
              
              LoginModel model=LoginModel(
                password: _password.text, 
                username: _username.text);
                
                String data=loginModelToJson(model);
                context.read<AuthNotifier>().loginFunc(data,context);
                
            }, child: Text('LOGIN',style: appStyle(12, Colors.white, FontWeight.w500),)),
          ),
        ),
        TextButton(onPressed: (){
          context.push('/register');
        }, child: const Text('Not registered yet? register here'))
        ],
      ),
    );
  }

}
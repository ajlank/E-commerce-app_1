import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/src/auth/models/login_model.dart';
import 'package:fashionapp/src/auth/models/register_model.dart';
import 'package:fashionapp/statemanagement/auth_notifier.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';


class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  late final TextEditingController _username;
  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _username=TextEditingController();
    _email=TextEditingController();
    _password=TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _username.dispose();
    _email.dispose();
    _password.dispose();
    context.pop();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
        context.go('/home');
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
            controller: _email,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.mail),
              hintText: 'email',
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
            child: context.watch<AuthNotifier>().isloading?const CircularProgressIndicator(
              backgroundColor: Colors.white,

            ): TextButton(onPressed: (){
               
               RegisterModel model=RegisterModel(
                email: _email.text, 
                username: _username.text,
                password: _password.text,
                );
               String data=registerModelToJson(model);
               print(data);
               context.read<AuthNotifier>().registerFunc(data);
            }, child: Text('SIGN UP',style: appStyle(12, Colors.white, FontWeight.w500),)),
          ),
        ),
        TextButton(onPressed: (){
          context.go('/login');
        }, child: const Text('Already registered? login here'))
        ],
      ),
    );
  }

}
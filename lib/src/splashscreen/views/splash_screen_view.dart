import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
   
  @override
  void initState() {
   _navigator();
    super.initState();
  }

  _navigator()async{
   await Future.delayed(const Duration(seconds: 2), (){
    if(GetStorage().read('firstOpen')==null){
      GoRouter.of(context).go('/onboarding');
    }else{
      GoRouter.of(context).go('/home');
    }
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.black,
    body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image:DecorationImage(image: AssetImage('assets/images/splashscreen.png')) 
      ),
    ),
    );
  }
}
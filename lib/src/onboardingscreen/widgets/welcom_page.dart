import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/utils/kstrings.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        // height: ScreenUtil().scaleHeight,
        // width: ScreenUtil().screenWidth,
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Image.asset('assets/images/getstarted.png'),
            SizedBox(
              height: 30.h,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(AppText.kWelcomeHeader,style: appStyle(24, Kolors.kPrimary, FontWeight.bold),),
            
             SizedBox(
              height: 20.h,
            ),

              SizedBox(
              width: ScreenUtil().screenWidth,
              child: Text(AppText.kWelcomeMessage,style:appStyle(11, Kolors.kGray, FontWeight.normal),textAlign: TextAlign.center,),
            ),
           
            TextButton(onPressed: (){
             context.go('/home');
            }, child: const Text("Let's get started")),

            SizedBox(
              height:2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Already have an account?', style: TextStyle(fontSize: 12),),
                TextButton(onPressed: (){
                    context.go('/login');
                }, child: const Text('Sign In', 
                style:TextStyle(color: Colors.blue, fontSize: 12),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
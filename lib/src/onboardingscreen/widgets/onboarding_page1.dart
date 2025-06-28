import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/utils/kstrings.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage1 extends StatelessWidget {
  const OnboardingPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().scaleWidth,
      child: Stack(
        children: [
          Image.asset('assets/images/experience.png', fit: BoxFit.cover,),
          Positioned(
            top:630,
            left:30,
            right: 30,
            child: Text(AppText.kOnboardHome,textAlign: TextAlign.center,
            style: appStyle(11, Kolors.kGray, FontWeight.normal),
            )
            )
        ],
      ),
    );
  }
}
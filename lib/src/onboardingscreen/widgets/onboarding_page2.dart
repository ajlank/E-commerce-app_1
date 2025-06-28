import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/utils/kstrings.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingPage2 extends StatelessWidget {
  const OnboardingPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().scaleWidth,
      child: Stack(
        children: [
          Image.asset('assets/images/wishlist.png'),
          Positioned(
            top:630,
            right: 30,
            left: 30,
            child: Text(AppText.kOnboardWishListMessage,textAlign: TextAlign.center,
            style: appStyle(12, Kolors.kGray, FontWeight.normal),)
            )
        ],
      ),
    );
  }
}
import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/const/constants.dart';
import 'package:fashionapp/const/resource.dart';
import 'package:fashionapp/src/cart/controller/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class FailedPayment extends StatelessWidget {
  const FailedPayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ReusableText(
          text: 'Payment',
          style: appStyle(16, Kolors.kPrimary, FontWeight.w600),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              R.ASSETS_IMAGES_FAILED_PNG,
              width: 250.w,
              height: 250.h,
            ),
          ),

          Center(
            child: ReusableText(
              text: 'Payment Failed',
              style: appStyle(20, Kolors.kPrimary, FontWeight.w600),
            ),
          ),
          SizedBox(height: 18.h),
          Center(
            child: ReusableText(
              text: 'Oops! Payment Failed! please try again',
              style: appStyle(13, Kolors.kGray, FontWeight.normal),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          context.read<CartNotifier>().setPaymentUrl('');
          // context.read<NotificationNotifier>().setReloadCount(
          //   NotificationCount.update,
          // );
          context.go('/home');
        },
        child: Container(
          height: 80,
          width: ScreenUtil().screenWidth,
          decoration: BoxDecoration(
            color: Kolors.kPrimary,
            borderRadius: kRadiusTop,
          ),
          child: ReusableText(
            text: 'Continue to Home',
            style: appStyle(16, Kolors.kWhite, FontWeight.w600),
          ),
        ),
      ),
    );
  }
}

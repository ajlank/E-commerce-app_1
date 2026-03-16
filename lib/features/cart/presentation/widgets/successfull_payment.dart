import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:fashionapp/core/const/constants.dart';
import 'package:fashionapp/core/const/resource.dart';
import 'package:fashionapp/features/address/presentation/controllers/address_notifier.dart';
import 'package:fashionapp/features/cart/presentation/controllers/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SuccessfullPayment extends StatelessWidget {
  const SuccessfullPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: ReusableText(
          text: 'Payment',
          style: appStyle(16, appColors.addressBlockTitle, FontWeight.w600),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              R.ASSETS_IMAGES_CHECKOUT_PNG,
              width: 250.w,
              height: 250.h,
            ),
          ),
          Center(
            child: ReusableText(
              text: 'Payment Successful',
              style: appStyle(20, appColors.addressBlockTitle, FontWeight.w600),
            ),
          ),
          SizedBox(height: 10.h),

          Center(
            child: ReusableText(
              text: 'Thank you for your purchase',
              style: appStyle(
                14,
                appColors.addressTextFieldDisabledBorder,
                FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          context.read<CartNotifier>().setPaymentUrl('');
          context.read<AddressNotifier>().clearAddress();
          // context.read<NotificationNotifier>().setReloadCount(
          //   NotificationCount.update,
          // );
          context.go('/home');
        },
        child: Container(
          height: 80,
          width: ScreenUtil().scaleWidth,
          decoration: BoxDecoration(
            color: appColors.addressBlockTitle,
            borderRadius: kRadiusTop,
          ),
          child: Center(
            child: ReusableText(
              text: 'Continue to Home',
              style: appStyle(16, appColors.addAddressText, FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}

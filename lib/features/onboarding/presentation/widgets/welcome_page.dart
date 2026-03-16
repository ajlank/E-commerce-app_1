import 'package:fashionapp/common/utils/kstrings.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return Scaffold(
      body: SizedBox(
        child: Column(
          children: [
            SizedBox(height: 100.h),
            Image.asset('assets/images/getstarted.png'),
            SizedBox(height: 30.h),
            SizedBox(height: 20.h),
            Text(
              AppText.kWelcomeHeader,
              style: appStyle(24, appColors.addressBlockTitle, FontWeight.bold),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: ScreenUtil().screenWidth,
              child: Text(
                AppText.kWelcomeMessage,
                style: appStyle(
                  11,
                  appColors.addressTextFieldDisabledBorder,
                  FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            TextButton(
              onPressed: () {
                context.go('/home');
              },
              child: const Text("Let's get started"),
            ),
            SizedBox(height: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(fontSize: 12),
                ),
                TextButton(
                  onPressed: () {
                    context.go('/login');
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: appColors.welcomeLink,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

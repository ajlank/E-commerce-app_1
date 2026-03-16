import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:fashionapp/features/onboarding/domain/entities/onboarding_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingContentPage extends StatelessWidget {
  const OnboardingContentPage({super.key, required this.content});

  final OnboardingContent content;

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return SizedBox(
      height: ScreenUtil().screenHeight,
      width: ScreenUtil().scaleWidth,
      child: Stack(
        children: [
          Image.asset(content.imageAsset, fit: BoxFit.cover),
          Positioned(
            top: 630,
            left: 30,
            right: 30,
            child: Text(
              content.message,
              textAlign: TextAlign.center,
              style: appStyle(
                11,
                appColors.addressTextFieldDisabledBorder,
                FontWeight.normal,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

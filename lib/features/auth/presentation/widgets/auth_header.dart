import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return Column(
      children: [
        Text(
          title,
          style: appStyle(22, appColors.authHeaderTitle, FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(subtitle),
      ],
    );
  }
}

import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AuthPrimaryButton extends StatelessWidget {
  const AuthPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: appColors.authHeaderTitle,
          borderRadius: BorderRadius.circular(22),
        ),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: appStyle(12, appColors.addAddressText, FontWeight.w500),
          ),
        ),
      ),
    );
  }
}

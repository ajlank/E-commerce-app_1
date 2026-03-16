import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AddressSubmitButton extends StatelessWidget {
  const AddressSubmitButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: appColors.addressSubmitBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          'S U B M I T',
          style: TextStyle(color: appColors.addAddressText, fontSize: 12),
        ),
      ),
    );
  }
}

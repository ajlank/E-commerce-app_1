import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:flutter/material.dart';

class AddressTextField extends StatelessWidget {
  const AddressTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onSubmitted,
    this.keyboard,
    this.readOnly = false,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboard;
  final void Function(String)? onSubmitted;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: TextField(
        keyboardType: keyboard,
        readOnly: readOnly,
        decoration: InputDecoration(
          hintText: hintText,
          errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: appColors.addressTextFieldErrorBorder,
              width: 0.5,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: appColors.addressTextFieldFocusedBorder,
              width: 0.5,
            ),
          ),
          focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: appColors.addressTextFieldErrorBorder,
              width: 0.5,
            ),
          ),
          disabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: appColors.addressTextFieldDisabledBorder,
              width: 0.5,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: appColors.addressTextFieldEnabledBorder,
              width: 0.5,
            ),
          ),
          border: InputBorder.none,
        ),
        controller: controller,
        cursorHeight: 25,
        style: appStyle(12, appColors.addressTextFieldText, FontWeight.normal),
        onSubmitted: onSubmitted,
      ),
    );
  }
}

import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color addAddressBackground;
  final Color addAddressText;
  final Color addressBlockTitle;
  final Color addressSubmitBackground;

  const AppColors({
    required this.addAddressBackground,
    required this.addAddressText,
    required this.addressBlockTitle,
    required this.addressSubmitBackground,
  });

  static const light = AppColors(
    addAddressBackground: Color.fromARGB(255, 200, 138, 115),
    addAddressText: Colors.white,
    addressBlockTitle: Color(0xFF5b3e2b),
    addressSubmitBackground: Color.fromARGB(255, 161, 125, 112),
  );
  

  @override
  AppColors copyWith({
    Color? addAddressBackground,
    Color? addAddressText,
    Color? addressBlockTitle,
    Color? addressSubmitBackground,
  }) {
    return AppColors(
      addAddressBackground: addAddressBackground ?? this.addAddressBackground,
      addAddressText: addAddressText ?? this.addAddressText,
      addressBlockTitle: addressBlockTitle ?? this.addressBlockTitle,
      addressSubmitBackground:
          addressSubmitBackground ?? this.addressSubmitBackground,
    );
  }

  @override
  AppColors lerp(ThemeExtension<AppColors>? other, double t) {
    if (other is! AppColors) return this;
    return AppColors(
      addAddressBackground: Color.lerp(
            addAddressBackground,
            other.addAddressBackground,
            t,
          ) ??
          addAddressBackground,
      addAddressText:
          Color.lerp(addAddressText, other.addAddressText, t) ?? addAddressText,
      addressBlockTitle:
          Color.lerp(addressBlockTitle, other.addressBlockTitle, t) ??
              addressBlockTitle,
      addressSubmitBackground: Color.lerp(
            addressSubmitBackground,
            other.addressSubmitBackground,
            t,
          ) ??
          addressSubmitBackground,
    );
  }
}

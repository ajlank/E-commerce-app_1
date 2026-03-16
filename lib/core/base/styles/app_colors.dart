import 'package:flutter/material.dart';

@immutable
class AppColors extends ThemeExtension<AppColors> {
  final Color addAddressBackground;
  final Color addAddressText;
  final Color addressBlockTitle;
  final Color addressSubmitBackground;
  final Color addressTextFieldErrorBorder;
  final Color addressTextFieldFocusedBorder;
  final Color addressTextFieldDisabledBorder;
  final Color addressTextFieldEnabledBorder;
  final Color addressTextFieldText;
  final Color addressTileAvatarBackground;
  final Color addressTileBadgeDefaultBackground;
  final Color addressTileBadgeInactiveBackground;
  final Color addressTileDeleteBackground;
  final Color addressTypeSelectedBackground;
  final Color authHeaderTitle;
  final Color cartCheckoutBackground;
  final Color cartTileSelectedBackground;
  final Color cartTileUpdateBackground;
  final Color webViewBackground;
  final Color categoryAvatarBackground;
  final Color entryNavBackground;
  final Color promoSliderAccent;
  final Color homeTabUnselected;
  final Color surfaceOffWhite;
  final Color onboardingDotUnselected;
  final Color welcomeLink;
  final Color productInfoTypeText;
  final Color productInfoStar;
  final Color splashBackground;

  const AppColors({
    required this.addAddressBackground,
    required this.addAddressText,
    required this.addressBlockTitle,
    required this.addressSubmitBackground,
    required this.addressTextFieldErrorBorder,
    required this.addressTextFieldFocusedBorder,
    required this.addressTextFieldDisabledBorder,
    required this.addressTextFieldEnabledBorder,
    required this.addressTextFieldText,
    required this.addressTileAvatarBackground,
    required this.addressTileBadgeDefaultBackground,
    required this.addressTileBadgeInactiveBackground,
    required this.addressTileDeleteBackground,
    required this.addressTypeSelectedBackground,
    required this.authHeaderTitle,
    required this.cartCheckoutBackground,
    required this.cartTileSelectedBackground,
    required this.cartTileUpdateBackground,
    required this.webViewBackground,
    required this.categoryAvatarBackground,
    required this.entryNavBackground,
    required this.promoSliderAccent,
    required this.homeTabUnselected,
    required this.surfaceOffWhite,
    required this.onboardingDotUnselected,
    required this.welcomeLink,
    required this.productInfoTypeText,
    required this.productInfoStar,
    required this.splashBackground,
  });

  static const light = AppColors(
    addAddressBackground: Color.fromARGB(255, 200, 138, 115),
    addAddressText: Colors.white,
    addressBlockTitle: Color(0xFF5b3e2b),
    addressSubmitBackground: Color.fromARGB(255, 161, 125, 112),
    addressTextFieldErrorBorder: Color(0xFFC80000),
    addressTextFieldFocusedBorder: Color(0xFF5b3e2b),
    addressTextFieldDisabledBorder: Color(0xFF83829A),
    addressTextFieldEnabledBorder: Color(0xFF83829A),
    addressTextFieldText: Color(0xFF000000),
    addressTileAvatarBackground: Color(0xFFFFE5DB),
    addressTileBadgeDefaultBackground: Color(0xFF4CAF50),
    addressTileBadgeInactiveBackground: Color(0xFFC1C0C8),
    addressTileDeleteBackground: Color(0xFFFF0000),
    addressTypeSelectedBackground: Color(0xFFB47043),
    authHeaderTitle: Color(0xFFA52A2A),
    cartCheckoutBackground: Color.fromARGB(255, 216, 151, 127),
    cartTileSelectedBackground: Color.fromARGB(77, 227, 189, 189),
    cartTileUpdateBackground: Color.fromARGB(255, 153, 103, 84),
    webViewBackground: Color(0x00000000),
    categoryAvatarBackground: Color.fromARGB(255, 245, 214, 167),
    entryNavBackground: Color(0x1FFFFFFF),
    promoSliderAccent: Color.fromARGB(255, 255, 95, 95),
    homeTabUnselected: Color(0xFF9E9E9E),
    surfaceOffWhite: Color(0xFFF3F4F8),
    onboardingDotUnselected: Color(0x42000000),
    welcomeLink: Color(0xFF2196F3),
    productInfoTypeText: Color.fromARGB(255, 75, 73, 73),
    productInfoStar: Color.fromARGB(255, 231, 178, 44),
    splashBackground: Color(0xFF000000),
  );

  @override
  AppColors copyWith({
    Color? addAddressBackground,
    Color? addAddressText,
    Color? addressBlockTitle,
    Color? addressSubmitBackground,
    Color? addressTextFieldErrorBorder,
    Color? addressTextFieldFocusedBorder,
    Color? addressTextFieldDisabledBorder,
    Color? addressTextFieldEnabledBorder,
    Color? addressTextFieldText,
    Color? addressTileAvatarBackground,
    Color? addressTileBadgeDefaultBackground,
    Color? addressTileBadgeInactiveBackground,
    Color? addressTileDeleteBackground,
    Color? addressTypeSelectedBackground,
    Color? authHeaderTitle,
    Color? cartCheckoutBackground,
    Color? cartTileSelectedBackground,
    Color? cartTileUpdateBackground,
    Color? webViewBackground,
    Color? categoryAvatarBackground,
    Color? entryNavBackground,
    Color? promoSliderAccent,
    Color? homeTabUnselected,
    Color? surfaceOffWhite,
    Color? onboardingDotUnselected,
    Color? welcomeLink,
    Color? productInfoTypeText,
    Color? productInfoStar,
    Color? splashBackground,
  }) {
    return AppColors(
      addAddressBackground: addAddressBackground ?? this.addAddressBackground,
      addAddressText: addAddressText ?? this.addAddressText,
      addressBlockTitle: addressBlockTitle ?? this.addressBlockTitle,
      addressSubmitBackground:
          addressSubmitBackground ?? this.addressSubmitBackground,
      addressTextFieldErrorBorder:
          addressTextFieldErrorBorder ?? this.addressTextFieldErrorBorder,
      addressTextFieldFocusedBorder:
          addressTextFieldFocusedBorder ?? this.addressTextFieldFocusedBorder,
      addressTextFieldDisabledBorder:
          addressTextFieldDisabledBorder ?? this.addressTextFieldDisabledBorder,
      addressTextFieldEnabledBorder:
          addressTextFieldEnabledBorder ?? this.addressTextFieldEnabledBorder,
      addressTextFieldText: addressTextFieldText ?? this.addressTextFieldText,
      addressTileAvatarBackground:
          addressTileAvatarBackground ?? this.addressTileAvatarBackground,
      addressTileBadgeDefaultBackground: addressTileBadgeDefaultBackground ??
          this.addressTileBadgeDefaultBackground,
      addressTileBadgeInactiveBackground: addressTileBadgeInactiveBackground ??
          this.addressTileBadgeInactiveBackground,
      addressTileDeleteBackground:
          addressTileDeleteBackground ?? this.addressTileDeleteBackground,
      addressTypeSelectedBackground:
          addressTypeSelectedBackground ?? this.addressTypeSelectedBackground,
      authHeaderTitle: authHeaderTitle ?? this.authHeaderTitle,
      cartCheckoutBackground:
          cartCheckoutBackground ?? this.cartCheckoutBackground,
      cartTileSelectedBackground:
          cartTileSelectedBackground ?? this.cartTileSelectedBackground,
      cartTileUpdateBackground:
          cartTileUpdateBackground ?? this.cartTileUpdateBackground,
      webViewBackground: webViewBackground ?? this.webViewBackground,
      categoryAvatarBackground:
          categoryAvatarBackground ?? this.categoryAvatarBackground,
      entryNavBackground: entryNavBackground ?? this.entryNavBackground,
      promoSliderAccent: promoSliderAccent ?? this.promoSliderAccent,
      homeTabUnselected: homeTabUnselected ?? this.homeTabUnselected,
      surfaceOffWhite: surfaceOffWhite ?? this.surfaceOffWhite,
      onboardingDotUnselected:
          onboardingDotUnselected ?? this.onboardingDotUnselected,
      welcomeLink: welcomeLink ?? this.welcomeLink,
      productInfoTypeText: productInfoTypeText ?? this.productInfoTypeText,
      productInfoStar: productInfoStar ?? this.productInfoStar,
      splashBackground: splashBackground ?? this.splashBackground,
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
      addressTextFieldErrorBorder: Color.lerp(
            addressTextFieldErrorBorder,
            other.addressTextFieldErrorBorder,
            t,
          ) ??
          addressTextFieldErrorBorder,
      addressTextFieldFocusedBorder: Color.lerp(
            addressTextFieldFocusedBorder,
            other.addressTextFieldFocusedBorder,
            t,
          ) ??
          addressTextFieldFocusedBorder,
      addressTextFieldDisabledBorder: Color.lerp(
            addressTextFieldDisabledBorder,
            other.addressTextFieldDisabledBorder,
            t,
          ) ??
          addressTextFieldDisabledBorder,
      addressTextFieldEnabledBorder: Color.lerp(
            addressTextFieldEnabledBorder,
            other.addressTextFieldEnabledBorder,
            t,
          ) ??
          addressTextFieldEnabledBorder,
      addressTextFieldText:
          Color.lerp(addressTextFieldText, other.addressTextFieldText, t) ??
              addressTextFieldText,
      addressTileAvatarBackground: Color.lerp(
            addressTileAvatarBackground,
            other.addressTileAvatarBackground,
            t,
          ) ??
          addressTileAvatarBackground,
      addressTileBadgeDefaultBackground: Color.lerp(
            addressTileBadgeDefaultBackground,
            other.addressTileBadgeDefaultBackground,
            t,
          ) ??
          addressTileBadgeDefaultBackground,
      addressTileBadgeInactiveBackground: Color.lerp(
            addressTileBadgeInactiveBackground,
            other.addressTileBadgeInactiveBackground,
            t,
          ) ??
          addressTileBadgeInactiveBackground,
      addressTileDeleteBackground: Color.lerp(
            addressTileDeleteBackground,
            other.addressTileDeleteBackground,
            t,
          ) ??
          addressTileDeleteBackground,
      addressTypeSelectedBackground: Color.lerp(
            addressTypeSelectedBackground,
            other.addressTypeSelectedBackground,
            t,
          ) ??
          addressTypeSelectedBackground,
      authHeaderTitle:
          Color.lerp(authHeaderTitle, other.authHeaderTitle, t) ??
              authHeaderTitle,
      cartCheckoutBackground:
          Color.lerp(cartCheckoutBackground, other.cartCheckoutBackground, t) ??
              cartCheckoutBackground,
      cartTileSelectedBackground: Color.lerp(
            cartTileSelectedBackground,
            other.cartTileSelectedBackground,
            t,
          ) ??
          cartTileSelectedBackground,
      cartTileUpdateBackground: Color.lerp(
            cartTileUpdateBackground,
            other.cartTileUpdateBackground,
            t,
          ) ??
          cartTileUpdateBackground,
      webViewBackground:
          Color.lerp(webViewBackground, other.webViewBackground, t) ??
              webViewBackground,
      categoryAvatarBackground: Color.lerp(
            categoryAvatarBackground,
            other.categoryAvatarBackground,
            t,
          ) ??
          categoryAvatarBackground,
      entryNavBackground:
          Color.lerp(entryNavBackground, other.entryNavBackground, t) ??
              entryNavBackground,
      promoSliderAccent:
          Color.lerp(promoSliderAccent, other.promoSliderAccent, t) ??
              promoSliderAccent,
      homeTabUnselected:
          Color.lerp(homeTabUnselected, other.homeTabUnselected, t) ??
              homeTabUnselected,
      surfaceOffWhite:
          Color.lerp(surfaceOffWhite, other.surfaceOffWhite, t) ??
              surfaceOffWhite,
      onboardingDotUnselected: Color.lerp(
            onboardingDotUnselected,
            other.onboardingDotUnselected,
            t,
          ) ??
          onboardingDotUnselected,
      welcomeLink: Color.lerp(welcomeLink, other.welcomeLink, t) ?? welcomeLink,
      productInfoTypeText: Color.lerp(
            productInfoTypeText,
            other.productInfoTypeText,
            t,
          ) ??
          productInfoTypeText,
      productInfoStar:
          Color.lerp(productInfoStar, other.productInfoStar, t) ??
              productInfoStar,
      splashBackground:
          Color.lerp(splashBackground, other.splashBackground, t) ??
              splashBackground,
    );
  }
}

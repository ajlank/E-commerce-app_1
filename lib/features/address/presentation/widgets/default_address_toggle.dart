import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DefaultAddressToggle extends StatelessWidget {
  const DefaultAddressToggle({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ReusableText(
            text: 'Set this address as default',
            style: appStyle(12, appColors.addressTextFieldText, FontWeight.normal),
          ),
          CupertinoSwitch(
            value: value,
            thumbColor: appColors.addressTileAvatarBackground,
            activeTrackColor: appColors.addressBlockTitle,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

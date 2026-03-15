import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ReusableText(
            text: 'Set this address as default',
            style: appStyle(12, Kolors.kDark, FontWeight.normal),
          ),
          CupertinoSwitch(
            value: value,
            thumbColor: Kolors.kSecondaryLight,
            activeTrackColor: Kolors.kPrimary,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

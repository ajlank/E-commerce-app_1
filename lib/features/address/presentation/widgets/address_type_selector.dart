import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddressTypeSelector extends StatelessWidget {
  const AddressTypeSelector({
    super.key,
    required this.addressTypes,
    required this.selectedType,
    required this.onSelected,
  });

  final List<String> addressTypes;
  final String selectedType;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: List.generate(addressTypes.length, (i) {
        final addressType = addressTypes[i];
        final isSelected = selectedType == addressType;

        return GestureDetector(
          onTap: () => onSelected(addressType),
          child: Container(
            margin: const EdgeInsets.all(15),
            padding: EdgeInsets.symmetric(horizontal: 18.w),
            decoration: BoxDecoration(
              color: isSelected ? Kolors.kPrimaryLight : Kolors.kWhite,
              border: Border.all(color: Kolors.kPrimary, width: 1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: ReusableText(
              text: addressType,
              style: appStyle(12, Kolors.kWhite, FontWeight.normal),
            ),
          ),
        );
      }),
    );
  }
}

import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HomeSearchRow extends StatelessWidget {
  const HomeSearchRow({
    super.key,
    required this.onSearchTap,
    required this.onFilterTap,
  });

  final VoidCallback onSearchTap;
  final VoidCallback onFilterTap;

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return Row(
      children: [
        Container(
          width: ScreenUtil().screenWidth - 80,
          decoration: BoxDecoration(
            border: Border.all(
              width: 0.5,
              color: appColors.addressTextFieldText,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: onSearchTap,
              child: Row(
                children: [
                  Icon(Icons.search, color: appColors.addressTextFieldText),
                  SizedBox(width: 7),
                  Text(
                    'Search Products',
                    style: TextStyle(color: appColors.addressTextFieldText),
                  ),
                ],
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: onFilterTap,
          icon: Icon(
            FontAwesome.sliders,
            color: appColors.addressTextFieldText,
          ),
        ),
      ],
    );
  }
}

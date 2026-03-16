import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SteppersTile extends StatelessWidget {
  const SteppersTile({
    super.key,
    required this.status,
    required this.date,
    required this.address,
    required this.color,
    required this.icon,
    required this.isLast,
  });

  final String status;
  final String date;
  final String address;
  final Color color;
  final IconData icon;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return SizedBox(
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 4.h),
            child: Column(
              children: [
                isLast == true
                    ? SizedBox.fromSize()
                    : Icon(
                        AntDesign.checkcircle,
                        size: 18,
                        color: appColors.addressBlockTitle,
                      ),
                isLast == true
                    ? SizedBox.fromSize()
                    : Center(
                        child: Container(
                          height: 35,
                          width: 2,
                          color: appColors.addressBlockTitle,
                        ),
                      ),
                isLast == true
                    ? Icon(
                        AntDesign.checkcircle,
                        size: 18,
                        color: appColors.addressBlockTitle,
                      )
                    : SizedBox.fromSize(),
              ],
            ),
          ),
          SizedBox(width: 10.w),
          Padding(
            padding: const EdgeInsets.only(top: 3.0),
            child: SizedBox(
              width: ScreenUtil().screenWidth * 0.85,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ReusableText(
                        text: status,
                        style: appStyle(
                          12,
                          appColors.addressTextFieldText,
                          FontWeight.w500,
                        ),
                      ),
                      ReusableText(
                        text: date,
                        style: appStyle(
                          10,
                          appColors.addressTextFieldDisabledBorder,
                          FontWeight.normal,
                        ),
                      ),
                      ReusableText(
                        text: address,
                        style: appStyle(
                          10,
                          appColors.addressTextFieldDisabledBorder,
                          FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    icon,
                    color: appColors.addressBlockTitle.withOpacity(0.4),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

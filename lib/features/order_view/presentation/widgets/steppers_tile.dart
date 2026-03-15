import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
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
                    : const Icon(
                        AntDesign.checkcircle,
                        size: 18,
                        color: Kolors.kPrimary,
                      ),
                isLast == true
                    ? SizedBox.fromSize()
                    : Center(
                        child: Container(
                          height: 35,
                          width: 2,
                          color: Kolors.kPrimary,
                        ),
                      ),
                isLast == true
                    ? const Icon(
                        AntDesign.checkcircle,
                        size: 18,
                        color: Kolors.kPrimary,
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
                        style: appStyle(12, Kolors.kDark, FontWeight.w500),
                      ),
                      ReusableText(
                        text: date,
                        style: appStyle(10, Kolors.kGray, FontWeight.normal),
                      ),
                      ReusableText(
                        text: address,
                        style: appStyle(10, Kolors.kGray, FontWeight.normal),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(icon, color: Kolors.kPrimary.withOpacity(0.4)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

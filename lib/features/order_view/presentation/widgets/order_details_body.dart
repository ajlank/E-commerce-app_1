import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:fashionapp/features/order_view/domain/entities/order.dart';
import 'package:fashionapp/features/order_view/presentation/widgets/order_details_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsBody extends StatelessWidget {
  const OrderDetailsBody({super.key, required this.order});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return Container(
      color: appColors.addAddressText,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            Divider(thickness: 0.5.h),
            SizedBox(height: 10.h),
            ReusableText(
              text: "Order Details",
              style: appStyle(
                13,
                appColors.addressTextFieldText,
                FontWeight.w600,
              ),
            ),
            SizedBox(height: 20.h),
            OrderDetailsTable(order: order),
          ],
        ),
      ),
    );
  }
}

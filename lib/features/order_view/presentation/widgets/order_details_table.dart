import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/features/order_view/domain/entities/order.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsTable extends StatelessWidget {
  const OrderDetailsTable({super.key, required this.order});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
        color: Kolors.kGrayLight,
        style: BorderStyle.solid,
        width: 0.5,
      ),
      children: [
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Text(
                'Logistics',
                style: appStyle(12, Kolors.kGray, FontWeight.normal),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Text(
                "\$ 10.00",
                style: appStyle(12, Kolors.kDark, FontWeight.normal),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Text(
                'Tracking code',
                style: appStyle(12, Kolors.kGray, FontWeight.normal),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Text(
                order.id.toString(),
                style: appStyle(12, Kolors.kDark, FontWeight.normal),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Text(
                'Payment Status',
                style: appStyle(12, Kolors.kGray, FontWeight.normal),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Text(
                order.paymentStatus.toUpperCase(),
                style: appStyle(12, Kolors.kDark, FontWeight.normal),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Text(
                'Delivery Status',
                style: appStyle(12, Kolors.kGray, FontWeight.normal),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Text(
                order.deliveryStatus.toUpperCase(),
                style: appStyle(12, Kolors.kDark, FontWeight.normal),
              ),
            ),
          ],
        ),
        TableRow(
          children: [
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Text(
                'Expected Delivery Date',
                style: appStyle(12, Kolors.kGray, FontWeight.normal),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.h),
              child: Text(
                order.createdAt
                    .add(const Duration(days: 3))
                    .toString()
                    .substring(0, 10),
                style: appStyle(12, Kolors.kDark, FontWeight.normal),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

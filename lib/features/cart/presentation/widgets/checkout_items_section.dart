import 'package:fashionapp/features/cart/domain/entities/cart.dart';
import 'package:fashionapp/features/cart/presentation/widgets/checkout_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutItemsSection extends StatelessWidget {
  const CheckoutItemsSection({super.key, required this.items});

  final List<Cart> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().screenHeight * 0.5,
      child: Column(
        children: List.generate(items.length, (i) {
          return CheckOutTile(cart: items[i]);
        }),
      ),
    );
  }
}

import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';

class CheckoutBottomBar extends StatelessWidget {
  const CheckoutBottomBar({
    super.key,
    required this.label,
    required this.onTap,
  });

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 200, 138, 115),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Center(
          child: ReusableText(
            text: label,
            style: appStyle(18, Colors.white, FontWeight.w400),
          ),
        ),
      ),
    );
  }
}

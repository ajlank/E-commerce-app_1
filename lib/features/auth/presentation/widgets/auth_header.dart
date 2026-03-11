import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: appStyle(22, Colors.brown, FontWeight.bold),
        ),
        const SizedBox(height: 5),
        Text(subtitle),
      ],
    );
  }
}

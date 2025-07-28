import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AddressPage extends HookWidget {
  const AddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      bottomNavigationBar:GestureDetector(
        onTap: () {
          
        },
        child: Container(
          height: 80,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 200, 138, 115),
          borderRadius: BorderRadius.circular(12.0)
        ),
        child: Center(child: ReusableText(text: "Add address", style: appStyle(18, Colors.white, FontWeight.w400))),
        ),
      ),
    );
  }
}
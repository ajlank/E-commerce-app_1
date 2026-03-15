import 'package:fashionapp/common/widgets/back_button.dart';
import 'package:fashionapp/common/widgets/email_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SearchAppBar({
    super.key,
    required this.controller,
    required this.onBack,
    required this.onSearch,
  });

  final TextEditingController controller;
  final VoidCallback onBack;
  final VoidCallback onSearch;

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 40.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Search',
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold,
          color: Colors.brown,
        ),
      ),
      centerTitle: true,
      leading: AppBackButton(onTap: onBack),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(40.h),
        child: EmailTextField(
          controller: controller,
          hintText: 'Search product..',
          prefixIcon: GestureDetector(
            onTap: onSearch,
            child: const Icon(Icons.search),
          ),
        ),
      ),
    );
  }
}

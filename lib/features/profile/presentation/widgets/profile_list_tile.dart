import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ProfileListTile extends StatelessWidget {
  const ProfileListTile({super.key, required this.title, this.onTap, required this.leading, });
  
  final String title;
  final void Function()? onTap;
  final IconData leading;

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return ListTile(
      visualDensity: VisualDensity.compact,
      onTap: onTap,
      leading: Icon(
        leading,
        color: appColors.homeTabUnselected,
      ),
      title: Text(
        title
      ),
      trailing: Icon(Icons.arrow_right, color: appColors.homeTabUnselected),
    );
  }
}

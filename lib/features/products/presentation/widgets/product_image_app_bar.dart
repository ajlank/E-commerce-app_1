import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProductImageAppBar extends StatelessWidget {
  const ProductImageAppBar({
    super.key,
    required this.images,
    required this.onBack,
  });

  final List<String> images;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return SliverAppBar(
      leading: IconButton(
        onPressed: onBack,
        icon: Icon(Icons.arrow_back, color: appColors.addAddressText),
      ),
      backgroundColor: appColors.addAddressText,
      expandedHeight: 320.h,
      collapsedHeight: 65.h,
      floating: true,
      actions: [Icon(AntDesign.heart, color: appColors.addAddressText)],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        background: ImageSlideshow(
          autoPlayInterval: 3000,
          isLoop: images.length > 1,
          children: List.generate(
            images.length,
            (i) {
              return Image.network(
                images[i],
                fit: BoxFit.cover,
              );
            },
          ),
        ),
      ),
    );
  }
}

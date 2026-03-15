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
    return SliverAppBar(
      leading: IconButton(
        onPressed: onBack,
        icon: const Icon(Icons.arrow_back, color: Colors.white),
      ),
      backgroundColor: Colors.white,
      expandedHeight: 320.h,
      collapsedHeight: 65.h,
      floating: true,
      actions: const [Icon(AntDesign.heart, color: Colors.white)],
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

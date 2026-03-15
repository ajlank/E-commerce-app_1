import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class HomeSearchRow extends StatelessWidget {
  const HomeSearchRow({
    super.key,
    required this.onSearchTap,
    required this.onFilterTap,
  });

  final VoidCallback onSearchTap;
  final VoidCallback onFilterTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: ScreenUtil().screenWidth - 80,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.black),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: onSearchTap,
              child: const Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(width: 7),
                  Text('Search Products'),
                ],
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: onFilterTap,
          icon: const Icon(FontAwesome.sliders),
        ),
      ],
    );
  }
}

import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:fashionapp/features/products/data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductInfoHeader extends StatelessWidget {
  const ProductInfoHeader({super.key, required this.product});

  final Products product;

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(7.0),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    product.clothesTypes.toUpperCase(),
                    style: TextStyle(
                      color: appColors.productInfoTypeText,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: appColors.productInfoStar,
                      ),
                      Text(product.ratings.toStringAsFixed(1)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Text(
                  product.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

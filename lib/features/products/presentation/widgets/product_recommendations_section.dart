import 'package:fashionapp/features/products/presentation/widgets/recommended_products.dart';
import 'package:flutter/material.dart';

class ProductRecommendationsSection extends StatelessWidget {
  const ProductRecommendationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.all(1.0),
        child: RecommendedProducts(),
      ),
    );
  }
}

import 'package:fashionapp/features/address/presentation/hooks/fetch/fetch_default.dart';
import 'package:fashionapp/features/home/presentation/widgets/home_tab_products_type.dart';
import 'package:fashionapp/features/categories/presentation/views/home_category.dart';
import 'package:fashionapp/features/home/presentation/widgets/home_categories_header.dart';
import 'package:fashionapp/features/home/presentation/widgets/home_location_bar.dart';
import 'package:fashionapp/features/home/presentation/widgets/home_promo_slider.dart';
import 'package:fashionapp/features/home/presentation/widgets/home_search_row.dart';
import 'package:fashionapp/features/products/presentation/widgets/explore_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

class HomeSecondView extends HookWidget {
  const HomeSecondView({super.key});

  @override
  Widget build(BuildContext context) {
    final result = fetchDefaultAddress();
    final address = result.address;
    final isLoading = result.isLoading;
    final error = result.error;

    if (isLoading) {
      return const Text('loading..');
    }
    if (error != null) {
      return Center(child: Text(error.toString()));
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeLocationBar(address: address?.address),
                HomeSearchRow(
                  onSearchTap: () {
                    context.push('/search');
                  },
                  onFilterTap: () {},
                ),
                const HomePromoSlider(),
                HomeCategoriesHeader(
                  onSeeAll: () {
                    context.push('/allcategories');
                  },
                ),
                const HomeCategorys(),
                const HomeTabProductsType(),
                const ExploreProducts(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

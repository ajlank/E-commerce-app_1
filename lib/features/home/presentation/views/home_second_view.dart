import 'package:fashionapp/features/address/presentation/hooks/fetch/fetch_default.dart';
import 'package:fashionapp/features/home/presentation/widgets/home_tab_products_type.dart';
import 'package:fashionapp/features/categories/presentation/views/home_category.dart';
import 'package:fashionapp/features/products/presentation/widgets/explore_products.dart';
import 'package:fashionapp/src/widgets/notification_bar_wid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
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
                const Text('Location', style: TextStyle(fontSize: 12)),
                Row(
                  children: [
                    SizedBox(
                      height: 50,
                      width: ScreenUtil().screenWidth * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.location_on),
                              const SizedBox(width: 4),
                              Text(
                                address == null
                                    ? 'Please select a location'
                                    : address.address,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const NotificationBarWid(),
                  ],
                ),
                Row(
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
                          onTap: () {
                            context.push('/search');
                          },
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
                      onPressed: () {},
                      icon: const Icon(FontAwesome.sliders),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(0),
                  child: ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(22),
                    child: Stack(
                      children: [
                        ImageSlideshow(
                          autoPlayInterval: 3000,
                          isLoop: true,
                          children: [
                            Image.network(
                              "https://images.template.net/108411/fashion-store-banner-template-edit-online.jpg",
                            ),
                            Image.network(
                              "https://tse4.mm.bing.net/th/id/OIP.cU4bM_4LDbAcT_r66BbOCQHaDt?pid=Api&P=0&h=220",
                            ),
                            Image.network(
                              "https://static.vecteezy.com/system/resources/previews/026/858/287/non_2x/of-a-vibrant-purple-dress-hanging-on-a-colorful-pink-wall-with-plenty-of-space-for-text-or-graphics-with-copy-space-free-photo.jpg",
                            ),
                          ],
                        ),
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'New Collection',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 95, 95),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Discount 50% off \nthe first transaction',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 95, 95),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Container(
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(42),
                                    color: Colors.brown,
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(6.0),
                                    child: Center(
                                      child: Text(
                                        'Shop Now',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 19.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Categories'),
                      TextButton(
                        onPressed: () {
                          context.push('/allcategories');
                        },
                        child: const Text('See All'),
                      ),
                    ],
                  ),
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

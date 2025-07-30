
import 'package:fashionapp/common/widgets/bottom_sheet_login.dart';
import 'package:fashionapp/src/addresses2/hooks/fetch/fetch_default.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/categories/home_category.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/explore_products.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/home/home_tab_products_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

class HomeSecondView extends HookWidget {
  const HomeSecondView({super.key});

 final bool isTapped = false;

  @override
  Widget build(BuildContext context) {

    final result=fetchDefaultAdd2();
    final address=result.address;
    final isLoading=result.isLoading;
    final error=result.error;

    if(isLoading){
      return Text('loading..');
    }
    if(error!=null){
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
                Text('Location', style: TextStyle(fontSize: 12)),
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
                              Icon(Icons.location_on),
                              SizedBox(width: 4),
                              Text(
                               address==null?'Please select a location':address.address
                               ,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
      
                    Padding(
                      padding: const EdgeInsets.only(bottom: 23.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          icon: Badge(
                            label: Text('9'),
                            child: Icon(Icons.notifications),
                          ),
                          onPressed: () {
                            if (GetStorage().read('accessToken') == null) {
                              
                              showLoginBottomSheet(context);
                            } else {
                              context.push('/notifications');
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      // width: ScreenUtil().screenWidth - 69,
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
                          child: Row(
                            children: [
                              Icon(Icons.search),
                              SizedBox(width: 7),
                              const Text('Search Products'),
                            ],
                          ),
                        ),
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(FontAwesome.sliders)),
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
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text(
                                'Discount 50% off \nthe first transaction',
                                style: TextStyle(
                                  color: Colors.white,
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
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Center(
                                      child: const Text(
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
                
                HomeCategorys(),
            
                   HomeTabProductsType(),
                  ExploreProducts(),
                  
              ],
            ),
          ),
        ],
      ),
    );
  }
}


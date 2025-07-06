import 'package:fashionapp/src/entrypoint/views/navigationviews/home_tab_products.dart';
import 'package:fashionapp/statemanagement/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductNotifier>(
      builder: (context, value, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 320.h,
                collapsedHeight: 65.h,
                floating: true,
                actions: [Icon(AntDesign.heart, color: Colors.white)],
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: false,
                  background: ImageSlideshow(
                    autoPlayInterval: 3000,
                    isLoop: value.product!.imageUrls.length>1?true:false,
                    children: List.generate(value.product!.imageUrls.length, 
                    (i){
                     return Image.network(
                      fit: BoxFit.cover,
                      value.product!.imageUrls[i],

                     );
                    })
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

//6:24:06


//6;32:02
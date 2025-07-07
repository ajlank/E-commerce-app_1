import 'package:fashionapp/src/entrypoint/views/navigationviews/expanded_text_widget.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/recommneded_products.dart';
import 'package:fashionapp/statemanagement/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
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
                leading:IconButton(onPressed: (){
                  context.pop();
                }, icon: Icon(Icons.arrow_back, color: Colors.white,)),
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
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    children: [
                      Container(
                        height:20.h,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(value.product!.clothesType.toUpperCase(),
                             style: TextStyle(color: const Color.fromARGB(255, 75, 73, 73)),
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: const Color.fromARGB(255, 231, 178, 44),),
                                  Text(value.product!.ratings.toStringAsFixed(1))
                              ],
                            )
                          ],
                        )
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(value.product!.title, style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      ),
                     
                    ],
                  ),
                ),
              ),
            SliverToBoxAdapter(
              child:ExpandedTextWidget(text:value.product!.description,)
            ),

            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Divider(
                  thickness: .8,
                
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Select Size', style: TextStyle(fontWeight: FontWeight.w700 ),)
                  ],
                ),
              ),
            ),
             SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text('Select Color', style: TextStyle(fontWeight: FontWeight.w700 ),)
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text('Recommendations', style: TextStyle(fontWeight: FontWeight.w700 ),),
              )
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: RecommendedProducts()
              ),
            ),
            ],
          ),
        );
      },
    );
  }
}

//7:16:00
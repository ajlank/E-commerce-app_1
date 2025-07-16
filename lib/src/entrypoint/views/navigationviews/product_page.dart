import 'package:fashionapp/common/widgets/bottom_sheet_login.dart';
import 'package:fashionapp/common/widgets/product_bottom_nav_bar.dart';
import 'package:fashionapp/common/widgets/select_color_widget.dart';
import 'package:fashionapp/common/widgets/select_size_widget.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/expanded_text_widget.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/recommneded_products.dart';
import 'package:fashionapp/statemanagement/color_size_notifier.dart';
import 'package:fashionapp/statemanagement/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    final accessToken= GetStorage().read('accessToken');
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
                    isLoop: value.product!.images.length>1?true:false,
                    children: List.generate(value.product!.images.length, 
                    (i){
                     return Image.network(
                      fit: BoxFit.cover,
                      value.product!.images[i],

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
                      SizedBox(
                        height:20.h,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(value.product!.clothesTypes.toUpperCase(),
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
              child: SelectSizeWidget(),
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
              child: SelectColorWidget(),
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
          bottomNavigationBar: ProductBottomNavBar(
            onPressed: () {
             if(accessToken==null){
               showLoginBottomSheet(context);

             }else{
               if(context.read<ColorSizeNotifier>().color=='' || context.read<ColorSizeNotifier>().size==''){
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: const Text('Size and color are empty'))
                );
               }else{
                print('Item added to the cart');
               }
             }    
            },
            price:value.product!.price.toStringAsFixed(2))
        );
      },
    );
  }
}

//7:16:00
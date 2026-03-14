import 'package:fashionapp/common/widgets/bottom_sheet_login.dart';
import 'package:fashionapp/common/widgets/product_bottom_nav_bar.dart';
import 'package:fashionapp/common/widgets/select_color_widget.dart';
import 'package:fashionapp/common/widgets/select_size_widget.dart';
import 'package:fashionapp/features/cart/data/models/create_cart_model.dart';
import 'package:fashionapp/features/cart/domain/entities/create_cart.dart';
import 'package:fashionapp/features/cart/presentation/controllers/cart_notifier.dart';
import 'package:fashionapp/features/products/presentation/widgets/recommended_products.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/expanded_text_widget.dart';
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
    final accessToken = GetStorage().read('accessToken');
    return Consumer<ProductNotifier>(
      builder: (context, value, child) {
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(
                  onPressed: () {
                    context.pop();
                  },
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
                    isLoop: value.product!.images.length > 1 ? true : false,
                    children: List.generate(
                      value.product!.images.length,
                      (i) {
                        return Image.network(
                          fit: BoxFit.cover,
                          value.product!.images[i],
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
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
                              value.product!.clothesTypes.toUpperCase(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 75, 73, 73),
                              ),
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Color.fromARGB(255, 231, 178, 44),
                                ),
                                Text(value.product!.ratings.toStringAsFixed(1)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Text(
                            value.product!.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: ExpandedTextWidget(text: value.product!.description),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(9.0),
                  child: const Divider(thickness: .8),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        'Select Size',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SelectSizeWidget(),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: const [
                      Text(
                        'Select Color',
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SelectColorWidget(),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Recommendations',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: RecommendedProducts(),
                ),
              ),
            ],
          ),
          bottomNavigationBar: ProductBottomNavBar(
            onPressed: () {
              if (accessToken == null) {
                showLoginBottomSheet(context);
              } else {
                if (context.read<ColorSizeNotifier>().color == '' ||
                    context.read<ColorSizeNotifier>().size == '') {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Size and color are empty')),
                  );
                } else {
                  CreateCart data = CreateCart(
                    product: context.read<ProductNotifier>().product!.id,
                    quantity: 1,
                    size: context.read<ColorSizeNotifier>().size,
                    color: context.read<ColorSizeNotifier>().color,
                  );

                  String cartData = createCartToJson(data);
                  context.read<CartNotifier>().add(cartData, context);
                }
              }
            },
            price: value.product!.price.toStringAsFixed(2),
          ),
        );
      },
    );
  }
}

//7:16:00

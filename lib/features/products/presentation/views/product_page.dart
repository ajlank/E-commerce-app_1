import 'package:fashionapp/common/widgets/bottom_sheet_login.dart';
import 'package:fashionapp/common/widgets/product_bottom_nav_bar.dart';
import 'package:fashionapp/common/widgets/select_color_widget.dart';
import 'package:fashionapp/common/widgets/select_size_widget.dart';
import 'package:fashionapp/features/cart/data/models/create_cart_model.dart';
import 'package:fashionapp/features/cart/domain/entities/create_cart.dart';
import 'package:fashionapp/features/cart/presentation/controllers/cart_notifier.dart';
import 'package:fashionapp/features/products/presentation/widgets/product_image_app_bar.dart';
import 'package:fashionapp/features/products/presentation/widgets/product_info_header.dart';
import 'package:fashionapp/features/products/presentation/widgets/product_recommendations_section.dart';
import 'package:fashionapp/features/products/presentation/widgets/product_section_divider.dart';
import 'package:fashionapp/features/products/presentation/widgets/product_section_title.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/expanded_text_widget.dart';
import 'package:fashionapp/features/cart/presentation/controllers/color_size_notifier.dart';
import 'package:fashionapp/features/products/presentation/controller/product_notifier.dart';
import 'package:flutter/material.dart';
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
              ProductImageAppBar(
                images: value.product!.images,
                onBack: () {
                  context.pop();
                },
              ),
              ProductInfoHeader(product: value.product!),
              SliverToBoxAdapter(
                child: ExpandedTextWidget(text: value.product!.description),
              ),
              const ProductSectionDivider(),
              const ProductSectionTitle(title: 'Select Size'),
              const SliverToBoxAdapter(
                child: SelectSizeWidget(),
              ),
              const ProductSectionTitle(title: 'Select Color'),
              const SliverToBoxAdapter(
                child: SelectColorWidget(),
              ),
              const ProductSectionTitle(title: 'Recommendations'),
              const ProductRecommendationsSection(),
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

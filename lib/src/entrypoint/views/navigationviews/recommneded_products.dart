import 'package:fashionapp/common/widgets/staggered_tile_widget.dart';
import 'package:fashionapp/hooks/results/fetch_recommended_products.dart';
import 'package:fashionapp/statemanagement/product_notifier.dart';
import 'package:fashionapp/statemanagement/wishlist_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class RecommendedProducts extends HookWidget{
  const RecommendedProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final accessToken = GetStorage().read('accessToken');

     final products=fetchRecommendedProducts(context.read<ProductNotifier>().product!.category);
     final product=products.products;
     final isLoading=products.isLoading;
     final error=products.error;

    if(isLoading){
      return CircularProgressIndicator();
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(product.length, (i) {
          final double mainAxisCellCount = (i % 2 == 0 ? 2.17 : 2.4);
          final pd = product[i];
          return StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: mainAxisCellCount,
            child: StaggeredTileWidget(
              onTap: () {
                if (accessToken == null) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 160,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            children: [
                              Text(
                                'You are restricted to proceed',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Divider(),
                              Text(
                                'To proceed please login into your account or register',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(height: 12),
                              GestureDetector(
                                onTap: () {
                                  context.go('/login');
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.brown,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  height: 40,
                                  width: double.infinity,
                                  child: Center(
                                    child: const Text(
                                      'Proceed to Login',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                 context.read<WishlistNotifier>().removeOrAddWishList(pd.id, (){});
                }
              },
              i: i,
              products: pd,
            ),
          );
        }),
      ),
    );
  }
}

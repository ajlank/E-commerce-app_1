import 'package:fashionapp/common/widgets/bottom_sheet_login.dart';
import 'package:fashionapp/common/widgets/staggered_tile_widget.dart';

import 'package:fashionapp/src/wishlist/fetch/fetch_wishlist.dart';
import 'package:fashionapp/src/wishlist/statemanagement/wishlist_notifier.dart';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';


class WishList extends HookWidget {
  const WishList({super.key});

  @override
  Widget build(BuildContext context) {
     final accessToken = GetStorage().read('accessToken');

     final products=fetchWishList();
     final product=products.products;
     final isLoading=products.isLoading;
     final refetch=products.refetch;
     final error=products.error;
     
    if(isLoading){
      return CircularProgressIndicator();
    }
    return (product.isEmpty)? Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text('No products found'),
    ): Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(product.length, (i) {
          final double mainAxisCellCount = (i % 2 == 0 ? 2.17 : 2.4);
          final pdc = product[i];
          return StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: mainAxisCellCount,
            child: StaggeredTileWidget(
              onTap: () {
                if (accessToken == null) {
                  showLoginBottomSheet(context);
               }else{
                context.read<WishlistNotifier>().removeOrAddWishList(pdc.id, refetch);
               }          
              },
              i: i, 
              products: pdc)
            
            );
        })
        ),
    );
  }
}
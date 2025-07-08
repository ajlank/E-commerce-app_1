import 'package:fashionapp/common/widgets/bottom_sheet_login.dart';
import 'package:fashionapp/common/widgets/staggered_tile_widget.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/home_tab_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

class ExploreProducts extends StatelessWidget {
  const ExploreProducts({super.key});

  @override
  Widget build(BuildContext context) {
    final accessToken = GetStorage().read('accessToken');

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(products.length, (i) {
          final double mainAxisCellCount = (i % 2 == 0 ? 2.17 : 2.4);
          final product = products[i];
          return StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: mainAxisCellCount,
            child: StaggeredTileWidget(
              onTap: () {
                if (accessToken == null) {
                  showLoginBottomSheet(context);
               }else{
                //handle wishlist functionality
               }          
              },
              i: i, 
              products: product)
            
            );
        })
        ),
    );
  }
}
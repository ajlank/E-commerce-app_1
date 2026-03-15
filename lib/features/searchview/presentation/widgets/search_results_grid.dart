import 'package:fashionapp/common/widgets/staggered_tile_widget.dart';
import 'package:fashionapp/features/products/data/models/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class SearchResultsGrid extends StatelessWidget {
  const SearchResultsGrid({
    super.key,
    required this.results,
    required this.isAuthed,
    required this.onRequireLogin,
    required this.onToggleWishlist,
  });

  final List<Products> results;
  final bool isAuthed;
  final VoidCallback onRequireLogin;
  final void Function(int productId) onToggleWishlist;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2.h),
      child: StaggeredGrid.count(
        crossAxisCount: 4,
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        children: List.generate(results.length, (i) {
          final double mainAxisCellCount = (i % 2 == 0 ? 2.17 : 2.4);
          final pdc = results[i];
          return StaggeredGridTile.count(
            crossAxisCellCount: 2,
            mainAxisCellCount: mainAxisCellCount,
            child: StaggeredTileWidget(
              onTap: () {
                if (!isAuthed) {
                  onRequireLogin();
                } else {
                  onToggleWishlist(pdc.id);
                }
              },
              i: i,
              products: pdc,
            ),
          );
        }),
      ),
    );
  }
}

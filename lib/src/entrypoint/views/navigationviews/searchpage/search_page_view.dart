import 'package:fashionapp/common/widgets/back_button.dart';
import 'package:fashionapp/common/widgets/bottom_sheet_login.dart';
import 'package:fashionapp/common/widgets/email_textfield.dart';
import 'package:fashionapp/common/widgets/staggered_tile_widget.dart';
import 'package:fashionapp/statemanagement/search_notifier.dart';
import 'package:fashionapp/statemanagement/wishlist_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SearchPageView extends StatefulWidget {
  const SearchPageView({super.key});

  @override
  State<SearchPageView> createState() => _SearchPageViewState();
}

class _SearchPageViewState extends State<SearchPageView> {
  late final TextEditingController _searchController;

  @override
  void initState() {
    _searchController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final accessToken = GetStorage().read('accessToken');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Search',
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.brown),
        ),
        centerTitle: true,
        leading: AppBackButton(
          onTap: () {
            context.pop();
            context.read<SearchNotifier>().clear();
          },
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: EmailTextField(
            controller: _searchController,
            hintText: 'Search product..',
            prefixIcon: GestureDetector(
              child: Icon(Icons.search),
              onTap: () {
                if(_searchController.text.isNotEmpty){
                    context.read<SearchNotifier>().searchFunction(
                  _searchController.text,
                );
                }
                
              },
            ),
          ),
        ),
      ),

      body: Consumer<SearchNotifier>(
        builder: (context, value, child) {
          return SingleChildScrollView(
            child: Column(
              children: [
               Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  value.getResults.isNotEmpty?
                  Text('Search'):Text(''),
                 
                  value.getResults.isNotEmpty?
                  Text(value.searchKey):Text(''),
                  ],
                 ),
               ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 2.h),
                  child: StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: List.generate(value.getResults.length, (i) {
                      final double mainAxisCellCount = (i % 2 == 0 ? 2.17 : 2.4);
                      final pdc = value.getResults[i];
                      return StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: mainAxisCellCount,
                        child: StaggeredTileWidget(
                          onTap: () {
                            if (accessToken == null) {
                              showLoginBottomSheet(context);
                            } else {
                              context
                                  .read<WishlistNotifier>()
                                  .removeOrAddWishList(pdc.id, () {});
                            }
                          },
                          i: i,
                          products: pdc,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

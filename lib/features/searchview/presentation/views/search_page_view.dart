import 'package:fashionapp/common/widgets/bottom_sheet_login.dart';
import 'package:fashionapp/features/searchview/presentation/controllers/search_notifier.dart';
import 'package:fashionapp/features/searchview/presentation/widgets/search_app_bar.dart';
import 'package:fashionapp/features/searchview/presentation/widgets/search_results_grid.dart';
import 'package:fashionapp/features/searchview/presentation/widgets/search_results_header.dart';
import 'package:fashionapp/features/wishlist/presentation/controllers/wishlist_notifier.dart';
import 'package:flutter/material.dart';
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
      appBar: SearchAppBar(
        controller: _searchController,
        onBack: () {
          context.pop();
          context.read<SearchNotifier>().clear();
        },
        onSearch: () {
          if (_searchController.text.isNotEmpty) {
            context.read<SearchNotifier>().searchFunction(
                  _searchController.text,
                );
          }
        },
      ),
      body: Consumer<SearchNotifier>(
        builder: (context, value, child) {
          final hasResults = value.getResults.isNotEmpty;
          return SingleChildScrollView(
            child: Column(
              children: [
                SearchResultsHeader(
                  hasResults: hasResults,
                  searchKey: value.searchKey,
                ),
                SearchResultsGrid(
                  results: value.getResults,
                  isAuthed: accessToken != null,
                  onRequireLogin: () {
                    showLoginBottomSheet(context);
                  },
                  onToggleWishlist: (productId) {
                    context
                        .read<WishlistNotifier>()
                        .removeOrAddWishList(productId, () {});
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

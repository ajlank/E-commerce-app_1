import 'package:fashionapp/features/home/presentation/controller/tab_controller_notifier.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const List<String> _homeTabs = [
  'All',
  'Popular',
  'Unisex',
  'Men',
  'Women',
  'Kids',
];

class HomeTabProductsType extends StatefulWidget {
  const HomeTabProductsType({super.key});

  @override
  State<HomeTabProductsType> createState() => _HomeTabProductsTypeState();
}

class _HomeTabProductsTypeState extends State<HomeTabProductsType>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _homeTabs.length, vsync: this);
    _tabController.addListener(_handleSelection);
  }

  void _handleSelection() {
    final controller = Provider.of<TabControllerNotifier>(
      context,
      listen: false,
    );
    if (_tabController.indexIsChanging) {
      setState(() {
        _currentTabIndex = _tabController.index;
      });
    }
    controller.setIndex(_homeTabs[_currentTabIndex]);
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 20,
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: appColors.addressBlockTitle,
            borderRadius: BorderRadius.circular(12),
          ),
          labelColor: appColors.addAddressText,
          dividerColor: appColors.addAddressText,
          labelPadding: EdgeInsets.zero,
          labelStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: appColors.homeTabUnselected,
            fontSize: 11,
          ),
          tabs: List.generate(
            _homeTabs.length,
            (i) => Tab(child: Center(child: Text(_homeTabs[i]))),
          ),
        ),
      ),
    );
  }
}

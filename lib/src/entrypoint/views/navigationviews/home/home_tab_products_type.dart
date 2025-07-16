import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/home_view.dart';
import 'package:fashionapp/statemanagement/tab_controller_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:provider/provider.dart';

class HomeTabProductsType extends StatefulWidget {
  const HomeTabProductsType({super.key});

  @override
  State<HomeTabProductsType> createState() => _HomeTabProductsTypeState();
}

class _HomeTabProductsTypeState extends State<HomeTabProductsType> with TickerProviderStateMixin{
  late final TabController _tabController;
  int _currentTabIndex = 0;
  @override
  void initState() {
    _tabController = TabController(length: homeTabs.length, vsync: this);
    _tabController.addListener(_handleSelection);
    super.initState();
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
    controller.setIndex(homeTabs[_currentTabIndex]);
  }

  @override
  void dispose() {
        _tabController.removeListener(_handleSelection);
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: SizedBox(
        height: 20,
        child: TabBar(
          controller: _tabController,
          indicator: BoxDecoration(
            color: Kolors.kPrimary,
            borderRadius: BorderRadius.circular(12),
          ),
          labelColor: Colors.white,
          dividerColor: Colors.white,
          labelPadding: EdgeInsets.zero,
          labelStyle: TextStyle(fontSize: 13, fontWeight: FontWeight.w400),
          unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            fontSize: 11,
          ),
          tabs: List.generate(
            homeTabs.length,
            (i) => Tab(child: Center(child: Text(homeTabs[i]))),
          ),
        ),
      ),
    );
  }
}

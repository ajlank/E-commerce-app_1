import 'package:fashionapp/src/entrypoint/views/navigationviews/cart_view.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/home_second_view.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/profile_view.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/wishlist_view.dart';
import 'package:fashionapp/statemanagement/navigation_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class AppEntryPointView extends StatefulWidget {
  const AppEntryPointView({super.key});

  @override
  State<AppEntryPointView> createState() => _AppEntryPointViewState();
}

class _AppEntryPointViewState extends State<AppEntryPointView> {

  List<Widget>bottomNavViews=[
    const HomeSecondView(),
    const WishListView(),
    const CartView(),
    const ProfileView()
  ];
 
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationPageNotifier>(
      builder: (context, value, child) {
      return Scaffold(
        bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white12,
          destinations: [
            NavigationDestination(
              icon: Icon(AntDesign.home),
             label: 'Home',
             ),
            NavigationDestination(icon: Icon(Ionicons.heart_outline),
             label: 'Wishlist',
             ), 
             NavigationDestination(
              icon: Badge(
                label: const Text('9'),
                child: Icon(AntDesign.shoppingcart)),
             label: 'Cart',
             ),
             NavigationDestination(icon: Icon(EvilIcons.user, size: 34,),
             label: 'Person',
             ),
            
          ],
          selectedIndex: value.index,
          onDestinationSelected: (val) {
           value.setIndex=val;
          },
        ),
        body: bottomNavViews[value.index],
      );   
      },
     
    );
  }
}


//2:52:04
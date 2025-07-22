import 'package:fashionapp/src/cart/fetch/fetch_cart.dart';
import 'package:fashionapp/src/cart/fetch/fetch_cart_count.dart';
import 'package:fashionapp/src/cart/statemanagement/cart_notifier.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/cart_view.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/home_second_view.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/profile_view.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/wishlist_view.dart';
import 'package:fashionapp/statemanagement/navigation_page_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class AppEntryPointView extends HookWidget {
   AppEntryPointView({super.key});

 final List<Widget>bottomNavViews=[
    const HomeSecondView(),
    const WishList(),
    const CartView(),
    const ProfileView()
  ];

  @override
  Widget build(BuildContext context) {

    final result=fetchCartCount(context);
    print(result);
   final counts= result.count;
   final count=counts.cartCount;
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
                label: Text(count.toString()),
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
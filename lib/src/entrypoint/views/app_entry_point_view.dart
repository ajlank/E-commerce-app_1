import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AppEntryPointView extends StatefulWidget {
  const AppEntryPointView({super.key});

  @override
  State<AppEntryPointView> createState() => _AppEntryPointViewState();
}

class _AppEntryPointViewState extends State<AppEntryPointView> {
  int val=0;
  @override
  Widget build(BuildContext context) {
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
           NavigationDestination(icon: Icon(AntDesign.shoppingcart),
           label: 'Cart',
           ),
           NavigationDestination(icon: Icon(EvilIcons.user, size: 34,),
           label: 'Person',
           ),
          
        ],
        selectedIndex: val,
        onDestinationSelected: (value) {
          setState(() {
            val=value;            
          });
        },
      )
    );
  }
}


//2:52:04
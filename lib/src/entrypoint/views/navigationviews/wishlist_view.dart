import 'package:flutter/material.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.white,
      child: Center(child: const Text('WishList')),
    );
  }
}
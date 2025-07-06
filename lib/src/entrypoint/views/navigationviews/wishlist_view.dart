import 'package:fashionapp/src/entrypoint/views/navigationviews/explore_products.dart';
import 'package:flutter/material.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child:Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: const Text('WishList'),
            ),
            ExploreProducts()
          ],
        ),
      )
    );
  }
}
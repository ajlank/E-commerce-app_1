import 'package:fashionapp/src/entrypoint/views/navigationviews/explore_products.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class WishListView extends StatelessWidget {
  const WishListView({super.key});

  @override
  Widget build(BuildContext context) {
    
    final accessToken=GetStorage().read('accessToken');
    if(accessToken==null){
      return RegisterView();
    }
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
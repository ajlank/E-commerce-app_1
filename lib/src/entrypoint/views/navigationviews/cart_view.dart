import 'package:fashionapp/src/entrypoint/views/navigationviews/register_view.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    
    final accessToken=GetStorage().read('accessToken');
    if(accessToken==null){
      return RegisterView();
    }
    return Center(

      child: const Text('Cart'),
    );
}
}
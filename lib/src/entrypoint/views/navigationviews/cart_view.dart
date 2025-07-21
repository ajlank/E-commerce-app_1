import 'package:fashionapp/src/auth/cart/model/cart_tile.dart';
import 'package:fashionapp/src/auth/cart/model/fetch/fetch_cart.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';

class CartView extends HookWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    
    final accessToken=GetStorage().read('accessToken');
 
    if(accessToken==null){
      return RegisterView();
    }
    final carts=fetchCart();
    final cart=carts.cart;
    return ListView(
     children:List.generate(cart.length, (i){
      final ct=cart[i];
      return CartTile(
        cart: ct, 
        onDelete: () {
          print('deleted');
        }, onUpdate: () {
          
        },
        );
     })
    );
}
}
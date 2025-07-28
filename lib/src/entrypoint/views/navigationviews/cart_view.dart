import 'package:fashionapp/src/cart/view/cart_tile.dart';
import 'package:fashionapp/src/cart/fetch/fetch_cart.dart';
import 'package:fashionapp/src/cart/controller/cart_notifier.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        centerTitle: true,
        
      ),
      body: ListView(
       children:List.generate(cart.length, (i){
        final ct=cart[i];
        return CartTile(
          cart: ct, 
          onDelete: () {
            context.read<CartNotifier>().delete(ct.id, carts.refetch);
            
          },
          onUpdate: () {
           context.read<CartNotifier>().update(ct.id, carts.refetch);
             
          },
          );
       }),
      
      ),
      bottomNavigationBar: Consumer<CartNotifier>(
        builder: (context, value, child) {
          return  Padding(
          padding: const EdgeInsets.all(5.0),
          child: GestureDetector(
            onTap: () {
              context.push('/checkout');
            },
            child: value.selectedCartItem.isNotEmpty? Container(
              height: 40,
             decoration: BoxDecoration(
               color: const Color.fromARGB(255, 216, 151, 127),
               borderRadius: BorderRadius.circular(12.1)
             ),
             child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: const Text('Click To Checkout', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                ),
                 Padding(
                  padding: const EdgeInsets.only(right:8.0),
                  child: Text('\$ ${value.totalPrice.toStringAsFixed(2)}', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                )
              ],
             ),
            ):SizedBox.shrink(),
          ),
        );
        },
      
      ),
    );
}
}
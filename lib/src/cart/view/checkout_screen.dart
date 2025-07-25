import 'package:fashionapp/src/address/fetch/fetch_default_address.dart';
import 'package:fashionapp/src/cart/statemanagement/cart_notifier.dart';
import 'package:fashionapp/src/cart/view/checkout_tile.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/address_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends HookWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final result=fetchDefaultAddress();
    final address=result.address;
    final isLoading=result.isLoading;
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        centerTitle: true,
      ),
      body: Consumer<CartNotifier>(
        builder: (context, value, child) {
         return ListView(
          children: [
            isLoading?SizedBox.shrink():
            AddressBlock(address: address,),
            SizedBox(
              height: 18.h,
            ),
              SizedBox(
                height: ScreenUtil().screenHeight*0.5,
                child: Column(
                  children:List.generate(value.selectedCartItem.length, (i){
                    return CheckOutTile(cart: value.selectedCartItem[i]);
                  })
                ),
              )
          ],
         );  
        },
        ),
    );
  }
}
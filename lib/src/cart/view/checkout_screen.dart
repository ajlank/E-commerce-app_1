import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/back_button.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/src/address/controller/address_notifier.dart';
import 'package:fashionapp/src/address/fetch/fetch_default_address.dart';
import 'package:fashionapp/src/cart/controller/cart_notifier.dart';
import 'package:fashionapp/src/cart/view/checkout_tile.dart';
import 'package:fashionapp/src/address/view/address_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends HookWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
     final result=fetchDefaultAddress();
    final address=result.address;
    final isLoading=result.isLoading;
    final error=result.error;
    if(isLoading){
      return Text('$error');
    }
    print(error);
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        centerTitle: true,
        leading: AppBackButton(
          onTap: () {
            context.read<AddressNotifier>().clearAddress();
            context.pop();
          },
        ),
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
    bottomNavigationBar: Consumer<CartNotifier>(
      builder: (context, value, child) {
        return GestureDetector(
        onTap: () {
          
        },
        child: Container(
          height: 80,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 200, 138, 115),
          borderRadius: BorderRadius.circular(12.0)
        ),
        child: Center(child: ReusableText(text: address==null?"Please add an address":"Proceed to payment", style: appStyle(18, Colors.white, FontWeight.w400))),
        ),
      );
      },
      
    ),

    );
  }
}

// 10:11:26
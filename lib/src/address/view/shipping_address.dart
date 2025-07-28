import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/src/address/fetch/fetch_address.dart';
import 'package:fashionapp/src/address/view/address_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ShippingAddress extends HookWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {

    final result=fetchAddress();
    final address=result.address;
    final isLoading=result.isLoading;
    final errorr=result.error;
    final refetch=result.refetch;

    if(isLoading){
      return Text('Loading..');
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Address'),
        centerTitle: true,
      ),

      body: ListView(
        children:List.generate(address.length, (i){
          return AddressTile(address: address[i], isCheckout: false,
          onDelete: () {
            
          },
          
          );
        }),
      ),
    bottomNavigationBar: GestureDetector(
        onTap: () {
          //
        },
        child: Container(
          height: 80,
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 200, 138, 115),
          borderRadius: BorderRadius.circular(12.0)
        ),
        child: Center(child: ReusableText(text: "Add address", style: appStyle(18, Colors.white, FontWeight.w400))),
        ),
      ),
    );
  }
}
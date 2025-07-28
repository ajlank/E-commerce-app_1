import 'package:fashionapp/src/address/fetch/fetch_address.dart';
import 'package:fashionapp/src/address/view/select_address_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CheckoutAddressList extends HookWidget {
  const CheckoutAddressList({super.key});

  @override
  Widget build(BuildContext context) {

    final result=fetchAddress();
    final address=result.address;
    final isLoading=result.isLoading;
    final error=result.error;
    
    if(isLoading){
      return Text('Loading...');
    }
    return ListView(
      children:List.generate(address.length, (i){
        return SelectAddressTile(address: address[i]);
      }),
    );
  }
}
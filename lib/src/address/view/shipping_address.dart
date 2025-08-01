import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/common/widgets/shimmers/list_shimmer.dart';
import 'package:fashionapp/src/address/controller/address_notifier.dart';
import 'package:fashionapp/src/address/view/address_tile.dart';
import 'package:fashionapp/src/addresses2/hooks/fetch/fetch_address_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ShippingAddress extends HookWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final result = fetchAddressList2();
    final address = result.address;
    final isLoading = result.isLoading;
    final errorr = result.error;
    final refetch = result.refetch;
    if (isLoading) {
      return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListShimmer(),
        ),
      );
    }
    context.read<AddressNotifier>().setRefetch(refetch);
    return Scaffold(
      appBar: AppBar(title: Text('Address'), centerTitle: true),

      body: ListView(
        children: List.generate(address.length, (i) {
          final addresss = address[i];
          return AddressTile(
            address: addresss,
            isCheckout: false,
            onDelete: () {
              context.read<AddressNotifier>().deleteAddress(
                addresss.id,
                refetch,
              );
            },
            setDefault: () {
              context.read<AddressNotifier>().setAsDefault(
                addresss.id,
                refetch,
              );
            },
          );
        }),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          context.push('/addaddress');
        },
        child: Container(
          height: 80,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 200, 138, 115),
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(
            child: ReusableText(
              text: "Add address",
              style: appStyle(18, Colors.white, FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/common/widgets/shimmers/list_shimmer.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:fashionapp/features/address/presentation/controllers/address_notifier.dart';
import 'package:fashionapp/features/address/presentation/hooks/fetch/fetch_address_list.dart';
import 'package:fashionapp/features/address/presentation/widgets/address_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ShippingAddress extends HookWidget {
  const ShippingAddress({super.key});

  @override
  Widget build(BuildContext context) {
    final result = fetchAddressList();
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
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
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
            color: appColors.addAddressBackground,
            borderRadius: BorderRadius.circular(12.0),
          ),
          child: Center(
            child: ReusableText(
              text: "Add address",
              style: appStyle(18, appColors.addAddressText, FontWeight.w400),
            ),
          ),
        ),
      ),
    );
  }
}

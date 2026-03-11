import 'package:fashionapp/common/widgets/shimmers/list_shimmer.dart';
import 'package:fashionapp/features/address/presentation/hooks/fetch/fetch_address_list.dart';
import 'package:fashionapp/features/address/presentation/widgets/select_address_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CheckoutAddressList extends HookWidget {
  const CheckoutAddressList({super.key});

  @override
  Widget build(BuildContext context) {
    final result = fetchAddressList();
    final address = result.address;
    final isLoading = result.isLoading;
    final error = result.error;

    if (isLoading) {
      return Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 12.w),
        child: ListShimmer(),
      );
    }
    return ListView(
      children: List.generate(address.length, (i) {
        return SelectAddressTile2(address: address[i]);
      }),
    );
  }
}

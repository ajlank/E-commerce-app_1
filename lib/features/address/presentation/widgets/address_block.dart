import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/features/address/domain/entities/address.dart';
import 'package:fashionapp/features/address/presentation/widgets/address_tile.dart';
import 'package:flutter/material.dart';

class AddressBlock extends StatelessWidget {
  const AddressBlock({super.key, required this.address});

  final Address? address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Shipping Address",
            style: appStyle(13, Kolors.kPrimary, FontWeight.bold),
          ),
          AddressTile(address: address!, isCheckout: true),
        ],
      ),
    );
  }
}

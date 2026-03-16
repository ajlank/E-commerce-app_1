import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:fashionapp/features/address/domain/entities/address.dart';
import 'package:fashionapp/features/address/presentation/controllers/address_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SelectAddressTile2 extends StatelessWidget {
  const SelectAddressTile2({super.key, required this.address});

  final Address address;

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return Consumer<AddressNotifier>(
      builder: (context, addressNotifier, child) {
        return ListTile(
          onTap: () {
            addressNotifier.setAddress(address);
            context.pop();
          },
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: appColors.addressTileAvatarBackground,
            child: Icon(
              MaterialIcons.location_pin,
              color: appColors.addressBlockTitle,
            ),
          ),
          title: ReusableText(
            text: address.addressType.toUpperCase(),
            style: appStyle(13, appColors.addressBlockTitle, FontWeight.bold),
          ),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    text: address.address,
                    style:
                        appStyle(11, appColors.addressBlockTitle, FontWeight.w400),
                  ),
                  ReusableText(
                    text: address.phone,
                    style:
                        appStyle(11, appColors.addressBlockTitle, FontWeight.w400),
                  ),
                ],
              ),
            ],
          ),
          trailing: ReusableText(
            text:
                addressNotifier.address != null &&
                    addressNotifier.address!.id == address.id
                ? "Selected"
                : "Select",
            style: appStyle(
              12,
              appColors.addressTypeSelectedBackground,
              FontWeight.w400,
            ),
          ),
        );
      },
    );
  }
}

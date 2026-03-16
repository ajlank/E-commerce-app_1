
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/change_address_modal.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:fashionapp/features/address/domain/entities/address.dart';
import 'package:fashionapp/features/address/presentation/controllers/address_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({
    super.key,
    required this.address,
    required this.isCheckout,
    this.setDefault,
    this.onDelete,
  });

  final Address address;

  final bool isCheckout;
  final void Function()? setDefault;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return Consumer<AddressNotifier>(
      builder: (context, addressNotifier, child) {
        return ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: appColors.addressTileAvatarBackground,
          child: Icon(
            MaterialIcons.location_pin,
            color: appColors.addressBlockTitle,
          ),
        ),
        title: ReusableText(
          text: addressNotifier.address == null
              ? address.addressType
              : addressNotifier.address!.addressType.toUpperCase(),
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
                  text: addressNotifier.address == null
                      ? address.address
                      : addressNotifier.address!.address,
                  style:
                      appStyle(11, appColors.addressBlockTitle, FontWeight.w400),
                ),
                ReusableText(
                  text: addressNotifier.address == null
                      ? address.phone
                      : addressNotifier.address!.phone,
                  style:
                      appStyle(11, appColors.addressBlockTitle, FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              if (isCheckout == true) {
                changeAddressBottomSheet(context);
              } else {
                setDefault!();
              }
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: isCheckout
                    ? appColors.addressBlockTitle
                    : addressNotifier.address == null
                        ? address.isDefault == true
                            ? appColors.addressTileBadgeDefaultBackground
                            : appColors.addressTileBadgeInactiveBackground
                        : addressNotifier.address!.isDefault != true
                            ? appColors.addressTileAvatarBackground
                            : appColors.addressTileBadgeInactiveBackground,
              ),
              child: ReusableText(
                text: isCheckout == true
                    ? "Change"
                    : addressNotifier.address == null
                        ? address.isDefault == true
                            ? "Default"
                            : "Set default"
                        : addressNotifier.address!.isDefault == true
                            ? "Default"
                            : "Set Default",
                style: appStyle(12, appColors.addAddressText, FontWeight.bold),
              ),
            ),
          ),
          isCheckout == true
              ? SizedBox.shrink()
              : GestureDetector(
                  onTap: onDelete,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: appColors.addressTileDeleteBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ReusableText(
                      text: 'Delete',
                      style:
                          appStyle(12, appColors.addAddressText, FontWeight.w400),
                    ),
                  ),
                )
        ],
      ),
      );
      },
     
    );
  }
}

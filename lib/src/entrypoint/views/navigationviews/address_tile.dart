import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/change_address_modal.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/src/address/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({super.key, required this.address, required this.isCheckout, this.setDefault, this.onDelete});
  
  final AddressModel address;
  final bool isCheckout;
  final void Function()? setDefault;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: Kolors.kPrimary,
        child: Icon(MaterialIcons.location_pin,color: Colors.white,),
      ),
      title: ReusableText(text: address.addressType.toUpperCase(), style: appStyle(13, Kolors.kPrimary, FontWeight.bold)),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           ReusableText(text: address.address, style: appStyle(11, Kolors.kPrimary, FontWeight.w400)),
           Padding(
             padding: const EdgeInsets.only(right: 12.0),
             child: GestureDetector(
              onTap: () {
                if(isCheckout==true){
                  changeAddressBottomSheet(context);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.brown
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text('change',style: appStyle(12, Colors.white, FontWeight.w500),),
                ))),
           )
        ],
      ),
    );
  }
}
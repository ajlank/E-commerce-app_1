import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/src/address/controller/address_notifier.dart';
import 'package:fashionapp/src/address/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class SelectAddressTile extends StatelessWidget {
  const SelectAddressTile({super.key, required this.address});
  
  final AddressModel address;

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressNotifier>(
      builder: (context, value, child) {
        print(value.address);
        return   ListTile(
          onTap: () {
            value.setAddress(address);
            context.pop();
          },
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: Kolors.kPrimary,
          child: Icon(MaterialIcons.location_pin,color: Colors.white,),
        ),
        title: ReusableText(
          text: address.addressType.toUpperCase(), style: appStyle(13, Kolors.kPrimary, FontWeight.bold)),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 ReusableText(text:address.address, style: appStyle(11, Kolors.kPrimary, FontWeight.w400)),
               ReusableText(text:address.phone,
               style: appStyle(11, Kolors.kPrimary, FontWeight.w400)),
               ],
             ),
             
          
          ],
        ),
        trailing: ReusableText(
          text: value.address!=null && value.address!.id==address.id?"Selected":'Select', 
          style: appStyle(12, Kolors.kPrimaryLight,FontWeight.w400)),
      );
      },
     
    );
  }
}
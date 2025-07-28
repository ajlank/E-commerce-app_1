import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/change_address_modal.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/src/address/controller/address_notifier.dart';
import 'package:fashionapp/src/address/model/address_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class AddressTile extends StatelessWidget {
  const AddressTile({super.key, required this.address, required this.isCheckout, this.setDefault, this.onDelete});
  
  final AddressModel address;
  final bool isCheckout;
  final void Function()? setDefault;
  final void Function()? onDelete;

  @override
  Widget build(BuildContext context) {
    return Consumer<AddressNotifier>(
      builder: (context, value, child) {
        return   ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundColor: Kolors.kPrimary,
          child: Icon(MaterialIcons.location_pin,color: Colors.white,),
        ),
        title: ReusableText(
          text: value.address==null? address.addressType.toUpperCase():value.address!.addressType, style: appStyle(13, Kolors.kPrimary, FontWeight.bold)),
        subtitle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Column(
              crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 ReusableText(text:value.address==null?
                  address.address:value.address!.address, style: appStyle(11, Kolors.kPrimary, FontWeight.w400)),
               ReusableText(text:value.address==null?
              address.phone:value.address!.phone,
               style: appStyle(11, Kolors.kPrimary, FontWeight.w400)),
               ],
             ),
             Padding(
               padding: const EdgeInsets.only(right: 12.0),
               child: GestureDetector(
                onTap: () {
                  if(isCheckout==true){
                    changeAddressBottomSheet(context);
                  }else{
                    setDefault!();
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: value.address!.isDefault!=true? Colors.greenAccent:const Color.fromARGB(255, 108, 49, 27)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                     isCheckout==true?'change':
                     value.address==null? address.isDefault==true
                      ?"Default"
                      :"Set default":
                     value.address!.isDefault==true? "Default":"Set default"
                     
                     ,style: appStyle(12, Colors.white, FontWeight.w500),),
                  ))
                  ),
                  
             ),
             isCheckout==true? SizedBox.shrink():
             Padding(
               padding: const EdgeInsets.only(right: 12.0),
               child: GestureDetector(
                onTap:onDelete,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: const Color.fromARGB(255, 212, 23, 10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                     'delete'
                     
                     ,style: appStyle(12, Colors.white, FontWeight.w500),),
                  ))
                  ),
                  
             ),
          
          ],
        ),
      
      );
      },
     
    );
  }
}
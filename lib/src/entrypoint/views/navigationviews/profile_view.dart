import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/widgets/profile_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
     children: [ 
      Container(
        color: Kolors.kOffWhite,
        child: Column(children: [
           ProfileListTile(title: 'My orders', leading:Octicons.checklist),
           ProfileListTile(title: 'Shipping Address', leading:MaterialIcons.location_pin),
           ProfileListTile(title: 'Privacy Policy', leading:MaterialIcons.policy),
           ProfileListTile(title: 'Help', leading:AntDesign.customerservice),

        ],),
      )
     ],
    );
  }
}
// 8:19:53
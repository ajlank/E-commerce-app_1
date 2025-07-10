import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/widgets/profile_list_tile.dart';
import 'package:fashionapp/src/entrypoint/views/navigationviews/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_storage/get_storage.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});
  
  @override
  Widget build(BuildContext context) {

    final accessToken=GetStorage().read('accessToken');
    if(accessToken==null){
      return RegisterView();
    }
    return ListView(
     children: [ 
      Container(
        color: Kolors.kOffWhite,
        child: Column(
          children: [
            SizedBox(
              height: 160.h,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                   backgroundColor:Colors.white,
                   radius: 35.0,
                   backgroundImage: NetworkImage('https://tse2.mm.bing.net/th/id/OIP.BVqRl5JkZkoe4SuUU2ENggHaHa?pid=Api&P=0&h=220'),
                   
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('ajlankhan@gmail.com'),
                   SizedBox(
                    height: 10,
                  ),
                  Text('Ajlan Khan', style: TextStyle(
                    fontSize:17,
                    fontWeight: FontWeight.w500
                  ),)
                ],
              ),
            ),
           ProfileListTile(title: 'My orders', leading:Octicons.checklist),
           ProfileListTile(title: 'Shipping Address', leading:MaterialIcons.location_pin),
           ProfileListTile(title: 'Privacy Policy', leading:MaterialIcons.policy),
           ProfileListTile(title: 'Help', leading:AntDesign.customerservice),
           Padding(
             padding: const EdgeInsets.all(12.0),
             child: Container(
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20)
              ),
              width: double.infinity,
               child: TextButton(onPressed: (){
               
               }, child: const Text('LOGOUT',
               style: TextStyle(color: Colors.white, 
               fontWeight: FontWeight.bold),)),
             ),
           )
        ],),
      )
     ],
    );
  }
}
// 8:19:53
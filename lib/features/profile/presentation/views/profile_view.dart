import 'package:fashionapp/features/profile/presentation/widgets/profile_list_tile.dart';
import 'package:fashionapp/features/profile/presentation/controllers/profile_notifier.dart';
import 'package:fashionapp/features/auth/presentation/views/register_view.dart';
import 'package:fashionapp/features/home/presentation/controller/navigation_page_notifier.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    return Consumer<ProfileNotifier>(
      builder: (context, value, child) {
        if (!value.isLoggedIn) {
          return const RegisterView();
        }
        final user = value.user;
        return ListView(
          children: [
            Container(
              color: appColors.surfaceOffWhite,
              child: Column(
                children: [
                  SizedBox(
                    height: 160.h,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: appColors.addAddressText,
                          radius: 35.0,
                          backgroundImage: const NetworkImage(
                            'https://tse2.mm.bing.net/th/id/OIP.BVqRl5JkZkoe4SuUU2ENggHaHa?pid=Api&P=0&h=220',
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(user?.email ?? ''),
                        const SizedBox(height: 10),
                        Text(
                          user?.username ?? '',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ProfileListTile(
                    title: 'My orders',
                    leading: Octicons.checklist,
                  ),
                  ProfileListTile(
                    title: 'Shipping Address',
                    onTap: () {
                      context.push('/address');
                    },
                    leading: MaterialIcons.location_pin,
                  ),
                  const ProfileListTile(
                    title: 'Privacy Policy',
                    leading: MaterialIcons.policy,
                  ),
                  const ProfileListTile(
                    title: 'Help',
                    leading: AntDesign.customerservice,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: appColors.addressTileDeleteBackground,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () async {
                          await value.logout();
                          context.read<NavigationPageNotifier>().setIndex = 0;
                          context.go('/');
                        },
                        child: Text(
                          'LOGOUT',
                          style: TextStyle(
                            color: appColors.addAddressText,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          Row(children: [Text('Location', style: TextStyle(fontSize: 12))]),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.location_on),
              const SizedBox(width: 2),
              Text(
                'Please select a location',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
        
      ),
      actions: [
        GestureDetector(
          onTap: () {
            if (GetStorage().read('accessToken') == null) {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 160,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          Text(
                            'You are restricted to proceed',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Divider(),
                          Text(
                            'To proceed please login into your account or register',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 12),
                          GestureDetector(
                            onTap: () {
                              context.go('/login');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.brown,
                                borderRadius: BorderRadius.circular(15),
                              ),
                              height: 40,
                              width: double.infinity,
                              child: Center(
                                child: const Text(
                                  'Proceed to Login',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              context.push('/notifications');
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Badge(
                label: const Text('9'),
                child: Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Icon(Icons.notifications),
                ),
              ),
            ),
          ),
        ),
      ],

      bottom: PreferredSize(preferredSize: Size.fromHeight(55.h),
       child:GestureDetector(
        onTap: () {

        },
        child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                  height: 700,
                  width: ScreenUtil().screenWidth - 80,
                  decoration: BoxDecoration(
                    // border: Border.all(width: 0.5, color: Colors.black),
                    // color: Colors.red,
                    // borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(

                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 48.h,
                          width: ScreenUtil().screenWidth - 80,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.5, color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 48.h,
                          width: ScreenUtil().screenWidth - 80,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.5, color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 129,
                      ),
                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 48.h,
                          width: ScreenUtil().screenWidth - 80,
                          decoration: BoxDecoration(
                            border: Border.all(width: 0.5, color: Colors.black),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 3:30:29
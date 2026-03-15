import 'package:fashionapp/features/notification/presentation/widgets/notification_bar_wid.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeLocationBar extends StatelessWidget {
  const HomeLocationBar({super.key, required this.address});

  final String? address;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Location', style: TextStyle(fontSize: 12)),
        Row(
          children: [
            SizedBox(
              height: 50,
              width: ScreenUtil().screenWidth * 0.8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on),
                      const SizedBox(width: 4),
                      Text(
                        address == null
                            ? 'Please select a location'
                            : address!,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const NotificationBarWid(),
          ],
        ),
      ],
    );
  }
}

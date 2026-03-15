import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/common/utils/kstrings.dart';
import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/back_button.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/common/widgets/shimmers/list_shimmer.dart';
import 'package:fashionapp/features/notification/presentation/controllers/notification_notifier.dart';
import 'package:fashionapp/features/order_view/presentation/hooks/fetch/fetch_order.dart';
import 'package:fashionapp/features/order_view/presentation/widgets/order_details_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:provider/provider.dart';

class TrackOrderPage extends HookWidget {
  const TrackOrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    final results = fetchOrder(context.read<NotificationNotifier>().orderId);

    final isLoading = results.isLoading;
    final order = results.order;
    final error = results.error;

    if (isLoading) {
      return const ListShimmer();
    }
    if (error != null) {
      return Center(child: Text(error.toString()));
    }

    return Scaffold(
      backgroundColor: Kolors.kWhite,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Kolors.kWhite,
        leading: const AppBackButton(),
        title: ReusableText(
          text: AppText.kTrack,
          style: appStyle(14, Kolors.kPrimary, FontWeight.w600),
        ),
      ),
      body: OrderDetailsBody(order: order!),
    );
  }
}

List<TrackData> trackingData = [
  TrackData(
    icon: Ionicons.clipboard_outline,
    date: "2024-04-07",
    status: "Order Placed",
    address: "1234, Elm St, Springfield",
  ),
  TrackData(
    icon: Feather.package,
    date: "2024-04-08",
    status: "Processing",
    address: "Processing Center, Springfield",
  ),
  TrackData(
    icon: MaterialCommunityIcons.truck_check_outline,
    date: "2024-04-09",
    status: "In Transit",
    address: "On the way, Springfield",
  ),
  TrackData(
    icon: Ionicons.checkbox_outline,
    date: "2024-04-10",
    status: "Delivered",
    address: "1234, Elm St, Springfield",
  ),
];

class TrackData {
  final String date;
  final String status;
  final String address;
  final IconData icon;

  TrackData({
    required this.date,
    required this.status,
    required this.address,
    required this.icon,
  });
}

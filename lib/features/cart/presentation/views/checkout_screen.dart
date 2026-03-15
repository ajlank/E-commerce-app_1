import 'package:fashionapp/common/widgets/back_button.dart';
import 'package:fashionapp/features/address/presentation/controllers/address_notifier.dart';
import 'package:fashionapp/features/address/presentation/hooks/fetch/fetch_default.dart';
import 'package:fashionapp/features/address/presentation/widgets/address_block.dart';
import 'package:fashionapp/features/cart/presentation/controllers/cart_notifier.dart';
import 'package:fashionapp/features/cart/data/models/check_out_model.dart';
import 'package:fashionapp/features/cart/presentation/widgets/checkout_bottom_bar.dart';
import 'package:fashionapp/features/cart/presentation/widgets/checkout_items_section.dart';
import 'package:fashionapp/features/cart/presentation/widgets/payment_web_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class CheckoutScreen extends HookWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final result = fetchDefaultAddress();
    final address = result.address;
    final isLoading = result.isLoading;
    final error = result.error;
    final accessToken = GetStorage().read('accessToken');
    return context.watch<CartNotifier>().paymentUrl.contains(
          'https://checkout.stripe.com',
        )
        ? const PaymentWebView()
        : Scaffold(
            appBar: AppBar(
              title: Text('Checkout'),
              centerTitle: true,
              leading: AppBackButton(
                onTap: () {
                  context.read<AddressNotifier>().clearAddress();
                  context.pop();
                },
              ),
            ),
            body: Consumer<CartNotifier>(
              builder: (context, value, child) {
                return ListView(
                  children: [
                    isLoading
                        ? SizedBox.shrink()
                        : AddressBlock(address: address),
                    SizedBox(height: 18.h),
                    CheckoutItemsSection(items: value.selectedCartItem),
                  ],
                );
              },
            ),
            bottomNavigationBar: Consumer<CartNotifier>(
              builder: (context, value, child) {
                return CheckoutBottomBar(
                  label: address == null
                      ? "Please add an address"
                      : "Proceed to payment",
                  onTap: () {
                    if (address == null) {
                      context.push('/address');
                    } else {
                      List<CartItem> checkoutItems = [];
                      for (var item in value.selectedCartItem) {
                        CartItem data = CartItem(
                          name: item.product.title,
                          size: item.size ?? '',
                          color: item.color ?? '',
                          id: item.product.id,
                          price: item.product.price.roundToDouble(),
                          cartQuantity: item.quantity,
                        );
                        checkoutItems.add(data);
                      }
                      CreateCheckOut data = CreateCheckOut(
                        accessToken: accessToken.toString(),
                        fcm: '',
                        totalAmount: value.totalPrice,
                        cartItems: checkoutItems,
                        address: context.read<AddressNotifier>().address == null
                            ? address.id
                            : context.read<AddressNotifier>().address!.id,
                      );

                      String c = createCheckOutToJson(data);
                      value.createCheckOut(c);
                    }
                  },
                );
              },
            ),
          );
  }
}


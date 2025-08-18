import 'package:fashionapp/common/widgets/app_style.dart';
import 'package:fashionapp/common/widgets/back_button.dart';
import 'package:fashionapp/common/widgets/reusable_text.dart';
import 'package:fashionapp/src/address/controller/address_notifier.dart';
import 'package:fashionapp/src/addresses2/hooks/fetch/fetch_default.dart';
import 'package:fashionapp/src/cart/controller/cart_notifier.dart';
import 'package:fashionapp/src/cart/view/checkout_tile.dart';
import 'package:fashionapp/src/address/view/address_block.dart';
import 'package:fashionapp/src/checkout/model/check_out_model.dart';
import 'package:fashionapp/src/checkout/payment/payment_web_view.dart';
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
    final result = fetchDefaultAdd2();
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
                    SizedBox(
                      height: ScreenUtil().screenHeight * 0.5,
                      child: Column(
                        children: List.generate(value.selectedCartItem.length, (
                          i,
                        ) {
                          return CheckOutTile(cart: value.selectedCartItem[i]);
                        }),
                      ),
                    ),
                  ],
                );
              },
            ),
            bottomNavigationBar: Consumer<CartNotifier>(
              builder: (context, value, child) {
                return GestureDetector(
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
                  child: Container(
                    height: 80,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 200, 138, 115),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                      child: ReusableText(
                        text: address == null
                            ? "Please add an address"
                            : "Proceed to payment",
                        style: appStyle(18, Colors.white, FontWeight.w400),
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}

// 10:11:26

// 2:54:03

import 'package:fashionapp/src/cart/controller/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCounterUi extends StatelessWidget {
  const CartCounterUi({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: BoxBorder.all(),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        GestureDetector(
          onTap: () {
            context.read<CartNotifier>().decrement();
          },
          child: Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Text('-'),
          )),
        Text(context.watch<CartNotifier>().qty.toString()),
       GestureDetector(
        onTap: () {
           context.read<CartNotifier>().increment();
        },
          child: Padding(
            padding: const EdgeInsets.only(right:8.0),
            child: Text('+'),
          )),

      ],),
    );
  }
}

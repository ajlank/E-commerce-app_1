import 'package:fashionapp/statemanagement/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ExpandedTextWidget extends StatelessWidget {
  const ExpandedTextWidget({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7.0),
      child: Column(
        children: [
         SizedBox(
            child: Text(text,
            style: TextStyle(color: const Color.fromARGB(255, 75, 73, 73)),
            maxLines: (!context.watch<ProductNotifier>().description?2:10),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () {
                  context.read<ProductNotifier>().setDescription();
                  
                },
                child: Text((!context.watch<ProductNotifier>().description?'View More':'View Less')),
              )
            ],
          )
        ],
      ),
    );
  }
}
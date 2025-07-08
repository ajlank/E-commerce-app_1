import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/statemanagement/color_size_notifier.dart';
import 'package:fashionapp/statemanagement/product_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SelectSizeWidget extends StatelessWidget {
  const SelectSizeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ColorSizeNotifier>(
      builder: (context, value, child) {
        return Row(
          children: List.generate(context.read<ProductNotifier>().product!.sizes.length, (i){
           return Padding(
             padding: const EdgeInsets.all(8.0),
             child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 210, 207, 207),
                borderRadius: BorderRadius.circular(12)
              ),
              child: TextButton(onPressed: (){
                final s=context.read<ProductNotifier>().product!.sizes[i];
                value.setSize(s);
              }, child: Text(context.read<ProductNotifier>().product!.sizes[i], style: TextStyle(
                fontSize: 17,
                color: (context.read<ProductNotifier>().product!.sizes[i]==value.size?Kolors.kPrimary:Kolors.kGray)
              ),))
             ),
           );
          })
        );
      },
    );
  }
}
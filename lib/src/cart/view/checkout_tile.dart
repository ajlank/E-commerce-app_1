import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/src/cart/model/cart_model.dart';
import 'package:fashionapp/src/cart/statemanagement/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CheckOutTile extends StatelessWidget {
  const CheckOutTile({super.key, required this.cart});
  
  final CartModel cart;
   
  @override
  Widget build(BuildContext context) {
    return Consumer<CartNotifier>(
      builder: (context, value, child) {
        return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: Container(
              height: 100,
              width: ScreenUtil().screenWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: value.selectedCartItemId.contains(cart.id)?
                 Color.fromARGB(77, 227, 189, 189):Kolors.kOffWhite,
              ),
              child: Row(
                children: [
                  Column(
                    children: [
                    Stack(
                      children: [
                          Container(
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12)
                            ),
                            child: Image.network(cart.product.images[0]),
                          ),
                      
                      ],
                      
                    )
                    ],
                  ),
                  SizedBox(
                    width: 10,
                  ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    
                      Text(cart.product.title,style: TextStyle(fontSize: 13.1,fontWeight: FontWeight.w300),),
                      SizedBox(
                      height: 6,
                    ),
                      Text('size: ${cart.size} || color: ${cart.color}',style: TextStyle(fontSize: 12.2,fontWeight: FontWeight.w300)),
                       SizedBox(
                      height: 6,
                    ),
                    SizedBox(
                      width: 200,
                      
                      child: Text(
                        style:TextStyle(fontSize: 12.2,fontWeight: FontWeight.w300),
                        overflow: TextOverflow.ellipsis,
                        cart.product.description,
                        maxLines: 2,
                      ),
                    )
                  ],),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Container(
                        height:25,
                        width: 50,
                        decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(12),
                       border: BoxBorder.all()
                        ),
                        child: Center(child: Text('* ${cart.quantity}')),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                       Text('\$ ${(cart.product.price*cart.quantity).toStringAsFixed(2)}'),
                         
                        
                   
                    ],
                  ),
                )
                ],
              ),
            ))
          ],
        ),
      );
      },
    );
  }
}

// 5:30:44
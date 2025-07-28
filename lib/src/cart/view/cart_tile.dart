import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/src/cart/view/cart_counter_ui.dart';
import 'package:fashionapp/src/cart/model/cart_model.dart';
import 'package:fashionapp/src/cart/controller/cart_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.cart, required this.onDelete, required this.onUpdate});
  
  final CartModel cart;
  final void Function()? onDelete;
  final void Function()? onUpdate;
   
  @override
  Widget build(BuildContext context) {
    return Consumer<CartNotifier>(
      builder: (context, value, child) {
        return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
           context.read<CartNotifier>().selectOrDeselct(cart.id, cart);
          },
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
                         Positioned(
                          bottom: 60,
                          right: 30,
                          child: IconButton(onPressed: onDelete, icon: Icon(Icons.delete_sharp,color: Colors.red,)))
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
                        GestureDetector(
                          onTap: () {
                            context.read<CartNotifier>().setSelectedCounter(cart.id,cart.quantity);
                          },
                          child: Container(
                            height:25,
                            width: 50,
                            decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(12),
                           border: BoxBorder.all()
                            ),
                            child: Center(child: Text('* ${cart.quantity}')),
                          ),
                        ),
                        SizedBox(
                          height: 13,
                        ),
                         (value.seletedCart!=null && value.seletedCart==cart.id)? CartCounterUi(): Text('\$ ${(cart.product.price*cart.quantity).toStringAsFixed(2)}'),
                           
                           (value.seletedCart!=null && value.seletedCart==cart.id)? GestureDetector(
                              onLongPress: () {
                                context.read<CartNotifier>().clearCart();
                              },
                              onTap: onUpdate,
                              child: Text('update',style: TextStyle(
                                color: Colors.white,backgroundColor: const Color.fromARGB(255, 153, 103, 84)),)
                           ):SizedBox.shrink()
                     
                      ],
                    ),
                  )
                  ],
                ),
              ))
            ],
          ),
        ),
      );
      },
    );
  }
}

// 5:30:44
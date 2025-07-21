import 'package:fashionapp/src/auth/cart/model/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.cart, required this.onDelete, required this.onUpdate});
  
  final CartModel cart;
  final void Function()? onDelete;
  final void Function()? onUpdate;
   
  @override
  Widget build(BuildContext context) {
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
              color: const Color.fromARGB(77, 227, 189, 189)
            ),
            child: Row(
              children: [
                Column(
                  children: [
                  Stack(
                    children: [
                        Container(
                          height: 100,
                          child: Image.network(cart.product.images[0]),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)
                          ),
                        ),
                     Positioned(
                      bottom: 60,
                      right: 30,
                      child: IconButton(onPressed: onDelete, icon: Icon(Icons.delete)))
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
                  
                    Text(cart.product.title),
                    SizedBox(
                    height: 6,
                  ),
                    Text('size: ${cart.size} || color: ${cart.color}'),
                     SizedBox(
                    height: 6,
                  ),
                  SizedBox(
                    width: 200,
                    
                    child: Text(
                      style: TextStyle(fontSize: 12),
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
                      height: 20,
                    ),
                    Text('${cart.product.price*cart.quantity}')
                  ],
                ),
              )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

// 5:30:44
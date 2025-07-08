import 'package:flutter/material.dart';

class ProductBottomNavBar extends StatelessWidget {
  const ProductBottomNavBar({super.key, required this.price, this.onPressed});
  
  final String price;
  final void Function()? onPressed;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const Text('Total Price', style: TextStyle(
                  fontWeight: FontWeight.w500,
                ),),
                Text("\$ $price")
              ],
            ),
      
            Column(
              children: [
                Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  
                  child: Padding(
                    padding: const EdgeInsets.only(left:12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.shopping_bag, color: Colors.white,),
                        TextButton(onPressed:onPressed , child: const Text('Add to cart',style: TextStyle(color: Colors.white),)),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
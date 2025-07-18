import 'package:fashionapp/src/model/products_model.dart';
import 'package:fashionapp/statemanagement/product_notifier.dart';
import 'package:fashionapp/statemanagement/wishlist_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_storage/get_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class StaggeredTileWidget extends StatelessWidget {
  const StaggeredTileWidget({
    super.key,
    required this.i,
    required this.products,
    this.onTap,
  });

  final int i;
  final Products products;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    final accessToken = GetStorage().read('accessToken');
    return GestureDetector(
      onTap: () {
        context.read<ProductNotifier>().setProduct(products);
        context.push('/product/${products.id}');
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 14, top: 30),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(10),
          child: SizedBox(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  color: Colors.white,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      //  Image.network(
                      //   fit: BoxFit.cover,
                      //    height: i%2==0?163.h:188.h,
                      //   products.imageUrls[i]),
                      Image.network(
                        height: 100,
                        width: 150,
                        fit: BoxFit.cover,
                        products.images[0],
                      ),

                      Positioned(
                        bottom: 70,
                        right: 7,
                        child: Consumer<WishlistNotifier>(
                          builder: (context, value, child) {
                            return GestureDetector(
                          onTap: onTap,
                          child: Icon(
                            
                             AntDesign.heart, color: value.wishList.contains(products.id)?Colors.red:Colors.grey,
                          ),
                        );  
                          },
                          )
                      ),
                    ],
                  ),
                ),
                // Positioned(
                //   child: Padding(
                //     padding: const EdgeInsets.only(bottom: 12),
                //     child: SizedBox(
                //       width: MediaQuery.of(context).size.width*0.5,
                //       child:
                //     ),
                //   ),
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 70,
                      child: Text(products.title, style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w500
                      )),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.star,
                            color: const Color.fromARGB(255, 239, 183, 15),
                          ),
                          Text(products.ratings.toStringAsFixed(1)),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 6,
                ),
                Text("\$${products.price.toStringAsFixed(2)}"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//ratings products.ratings.toStringAsFixed(1)
//price products.price.toStringAsFixed(2)
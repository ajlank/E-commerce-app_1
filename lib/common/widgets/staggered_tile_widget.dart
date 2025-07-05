import 'package:fashionapp/common/utils/kcolors.dart';
import 'package:fashionapp/src/model/products_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get_storage/get_storage.dart';

class StaggeredTileWidget extends StatelessWidget {
  const StaggeredTileWidget({super.key});
  // final int i;
  // final Products products;
  // final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final accessToken = GetStorage().read('accessToken');

    return GestureDetector(
      onTap: () {
        print('clicked');
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 14,top:30),
        child: ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(10),
          child: Container(
            width: 150,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  // height: 100,
                  width: 150,
                  color: Kolors.kPrimary,
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
                        "https://d3thqe68ymbqps.cloudfront.net/1879562-medium_default/kids-fashion-boy-shoes-basketball-shoes-for-kids-kids-shoes-boys-sneak.jpg",
                      ),

                      Positioned(
                        bottom: 60,
                        right: -5,
                        child: IconButton(
                          onPressed: () {
                            print('love selected');
                          },
                          icon: Icon(AntDesign.heart, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Lv Trainer', style: TextStyle()),                          
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: const Color.fromARGB(255, 239, 183, 15),
                              ),
                              const Text('4.5'),
                            ],
                          ),
                    
                    
                        ],
                      ),
                    ),
                  ),
                ),
                      const Text("\$ 798.88"),
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
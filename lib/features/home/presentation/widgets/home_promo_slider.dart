import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class HomePromoSlider extends StatelessWidget {
  const HomePromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(22),
        child: Stack(
          children: [
            ImageSlideshow(
              autoPlayInterval: 3000,
              isLoop: true,
              children: const [
                Image(
                  image: NetworkImage(
                    "https://images.template.net/108411/fashion-store-banner-template-edit-online.jpg",
                  ),
                ),
                Image(
                  image: NetworkImage(
                    "https://tse4.mm.bing.net/th/id/OIP.cU4bM_4LDbAcT_r66BbOCQHaDt?pid=Api&P=0&h=220",
                  ),
                ),
                Image(
                  image: NetworkImage(
                    "https://static.vecteezy.com/system/resources/previews/026/858/287/non_2x/of-a-vibrant-purple-dress-hanging-on-a-colorful-pink-wall-with-plenty-of-space-for-text-or-graphics-with-copy-space-free-photo.jpg",
                  ),
                ),
              ],
            ),
            Positioned(
              top: 20,
              left: 20,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'New Collection',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 95, 95),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Discount 50% off \nthe first transaction',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 95, 95),
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(42),
                        color: Colors.brown,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(6.0),
                        child: Center(
                          child: Text(
                            'Shop Now',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

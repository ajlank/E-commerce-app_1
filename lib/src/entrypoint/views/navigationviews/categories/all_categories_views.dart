import 'package:fashionapp/src/model/categories_model.dart';
import 'package:fashionapp/src/model/products_model.dart';
import 'package:fashionapp/statemanagement/category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AllCategoriesViews extends StatelessWidget {
  const AllCategoriesViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Categories',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.1),),
        centerTitle: true,
       ),
       body:ListView.builder(
        itemCount: cat.length,
        itemBuilder: (context, index) {
          final item=cat[index];
          return ListTile(
            onTap: () {
              context.read<CategoryNotifier>().setCategoryAndId(item.id, item.title);
              context.push('/category');
            },
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 245, 214, 167),
              radius:20,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: SvgPicture.network(item.imageUrl),
              ),
            ),
            title: Text(item.title,style: TextStyle(fontSize: 11.3),),
            trailing: Icon(Icons.keyboard_double_arrow_right),
          );
        },
       )
    );
  }
}



List<Categories> cat = [
  Categories(
    title: "Pants",
    id: 1,
    imageUrl: "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fjeans.svg?alt=media&token=eb62f916-a4c2-441a-a469-5684f1a62526",
  ),
  Categories(
    title: "T-Shirts",
    id: 5,
    imageUrl: "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fjersey.svg?alt=media&token=6ca7eabd-54b3-47bb-bb8f-41c3a8920171",
  ),
  Categories(
    title: "Sneakers",
    id: 3,
    imageUrl: "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Frunning_shoe.svg?alt=media&token=0dcb0e57-315e-457c-89dc-1233f6421368",
  ),
  Categories(
    title: "Dresses",
    id: 2,
    imageUrl: "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fdress.svg?alt=media&token=cf832383-4c8a-4ee1-9676-b66c4d515a1c",
  ),
  Categories(
    title: "Jackets",
    id: 4,
    imageUrl: "https://firebasestorage.googleapis.com/v0/b/authenification-b4dc9.appspot.com/o/uploads%2Fjacket.svg?alt=media&token=ffdc9a1e-917f-4e8f-b58e-4df2e6e8587e",
  ),
  
];
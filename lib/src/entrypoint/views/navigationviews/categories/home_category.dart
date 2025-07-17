import 'package:fashionapp/hooks/results/fetch_home_categories.dart';
import 'package:fashionapp/statemanagement/category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeCategorys extends HookWidget {
  const HomeCategorys({super.key});

  @override
  Widget build(BuildContext context) {

   final result=fetchHomeCategories();
   final homeCategories=result.categories;
   final isLoading=result.isLoading;
   final error=result.error;
  
    if(isLoading){
      return const CircularProgressIndicator();
    }
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(homeCategories.length, (index) {
          final item = homeCategories[index];
          return GestureDetector(
            onTap: () {
              context.read<CategoryNotifier>().setCategoryAndId(
                item.id,
                item.title,
              );
              context.push('/category');
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(255, 245, 214, 167),
                      radius: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.network(item.imageUrl),
                      ),
                    ),
                    Text(item.title, style: TextStyle(fontSize: 11.3)),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

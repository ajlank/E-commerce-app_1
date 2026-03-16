import 'package:fashionapp/features/categories/presentation/hooks/fetch/fetch_home_categories.dart';
import 'package:fashionapp/features/categories/presentation/controller/category_notifier.dart';
import 'package:fashionapp/core/base/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeCategorys extends HookWidget {
  const HomeCategorys({super.key});

  @override
  Widget build(BuildContext context) {
    final appColors =
        Theme.of(context).extension<AppColors>() ?? AppColors.light;
    final result = fetchHomeCategories();
    final homeCategories = result.categories;
    final isLoading = result.isLoading;
    final error = result.error;

    if (isLoading) {
      return const CircularProgressIndicator();
    }
    if (error != null) {
      return Center(child: Text(error.toString()));
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
                      backgroundColor: appColors.categoryAvatarBackground,
                      radius: 20,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: SvgPicture.network(item.imageUrl),
                      ),
                    ),
                    Text(item.title, style: const TextStyle(fontSize: 11.3)),
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

import 'package:fashionapp/features/categories/presentation/hooks/fetch/fetch_categories.dart';
import 'package:fashionapp/statemanagement/category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AllCategoriesViews extends HookWidget {
  const AllCategoriesViews({super.key});

  @override
  Widget build(BuildContext context) {
    final result = fetchCategories();
    final categories = result.categories;
    final isLoading = result.isLoading;
    final error = result.error;

    if (isLoading) {
      return const CircularProgressIndicator();
    }
    if (error != null) {
      return Center(child: Text(error.toString()));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Categories',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.1),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return ListTile(
            onTap: () {
              context
                  .read<CategoryNotifier>()
                  .setCategoryAndId(item.id, item.title);
              context.push('/category');
            },
            leading: CircleAvatar(
              backgroundColor: const Color.fromARGB(255, 245, 214, 167),
              radius: 20,
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: SvgPicture.network(item.imageUrl),
              ),
            ),
            title: Text(item.title, style: const TextStyle(fontSize: 11.3)),
            trailing: const Icon(Icons.keyboard_double_arrow_right),
          );
        },
      ),
    );
  }
}

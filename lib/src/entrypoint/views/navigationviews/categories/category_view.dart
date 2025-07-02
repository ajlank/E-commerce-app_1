import 'package:fashionapp/statemanagement/category_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Category'),
      ),
      body: Column(
        children: [
          Center(
            child: Text(context.watch<CategoryNotifier>().category),
          )
        ],
      ),
    );
  }
}
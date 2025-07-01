import 'package:flutter/material.dart';

class AllCategoriesViews extends StatelessWidget {
  const AllCategoriesViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Text('Categories',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.1),),
        centerTitle: true,
       ),
    );
  }
}

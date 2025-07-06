import 'package:flutter/material.dart';

class TestPoductView extends StatelessWidget {
  const TestPoductView({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Text(productId),
    );
  }
}
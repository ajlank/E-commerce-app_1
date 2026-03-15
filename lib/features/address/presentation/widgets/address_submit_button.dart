import 'package:flutter/material.dart';

class AddressSubmitButton extends StatelessWidget {
  const AddressSubmitButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 161, 125, 112),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: const Text(
          'S U B M I T',
          style: TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}

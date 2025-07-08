import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

Future<dynamic> showLoginBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (context) {
      return SizedBox(
        height: 160,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Text(
                'You are restricted to proceed',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              Divider(),
              Text(
                'To proceed please login into your account or register',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  context.go('/login');
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.brown,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 40,
                  width: double.infinity,
                  child: Center(
                    child: const Text(
                      'Proceed to Login',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
                                      ),
                                    ),
                                  );
                                },
                              );
}
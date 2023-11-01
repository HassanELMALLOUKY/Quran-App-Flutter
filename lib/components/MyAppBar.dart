import 'package:flutter/material.dart';
import 'package:quran_shamil/utils/Colors.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primary,
      title: const Text(
        'My Custom App',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}

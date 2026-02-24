import 'package:flutter/material.dart';

class MySquareTile extends StatelessWidget {
  final String imagePath;
  final void Function()? onTap;
  const MySquareTile({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Image.asset(imagePath, height: 40),
      ),
    );
  }
}

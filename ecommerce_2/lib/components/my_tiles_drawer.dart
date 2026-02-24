import 'package:flutter/material.dart';

class MyTiles extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final IconData icon;
  MyTiles({
    super.key,
    required this.text,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      //text
      title: Text(text),

      //logo
      leading: Icon(icon, color: Theme.of(context).colorScheme.inversePrimary),

      //ontap
      onTap: onTap,
    );
  }
}

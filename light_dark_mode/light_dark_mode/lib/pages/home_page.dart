import 'package:flutter/material.dart';
import 'package:light_dark_mode/components/button.dart';

import '../components/box.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: MyBox(
          child: MyButton(
            color: Theme.of(context).colorScheme.primary,
            ontap: () {},
          ),
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}

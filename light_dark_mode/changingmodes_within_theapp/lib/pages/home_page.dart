import 'package:changingmodes_within_theapp/themes/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:changingmodes_within_theapp/components/button.dart';
import 'package:provider/provider.dart';

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
            ontap: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}

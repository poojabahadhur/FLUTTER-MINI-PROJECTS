import 'package:ecommerce_2/components/buttons.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo
            Icon(
              Icons.shopping_cart_checkout_rounded,
              size: 90,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            SizedBox(height: 10),
            //tittle
            Text(
              "Minimal",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30,
              ),
            ),

            //quote
            Text(
              "A Minimal touch up ahead for Classy look...",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 20),
            //button
            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop_page'),
              child: Icon(Icons.arrow_forward_rounded),
            ),
          ],
        ),
      ),
    );
  }
}

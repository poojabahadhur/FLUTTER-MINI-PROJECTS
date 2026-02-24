import 'package:ecommerce_2/components/my_tiles_drawer.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              // DrawerHeader with logo
              DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: const BoxDecoration(color: Colors.transparent),
                child: Center(
                  child: Icon(
                    Icons.shopping_cart_checkout_rounded,
                    size: 90,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
              ),

              // list of tiles
              MyTiles(
                icon: Icons.shop,
                text: "Shop",
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              MyTiles(
                icon: Icons.card_travel,
                text: "Cart",
                onTap: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/cart_page');
                },
              ),
            ],
          ),

          // exit tile at the bottom
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: MyTiles(
              icon: Icons.exit_to_app,
              text: "Exit",
              onTap: () => Navigator.pushNamed(context, '/intro_page'),
            ),
          ),
        ],
      ),
    );
  }
}

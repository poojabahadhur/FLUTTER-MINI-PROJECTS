import 'package:ecommerce_2/components/my_drawer.dart';
import 'package:ecommerce_2/components/product.dart';
import 'package:ecommerce_2/components/product_tile.dart';
import 'package:ecommerce_2/components/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 70),
          child: Text("Shop page"),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer: MyDrawer(),
      body: ListView(
        children: [
          SizedBox(height: 25),
          // shop title
          Center(
            child: Text(
              "Pick from a selected list of quality products",
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                // get each individual product from shop
                final product = products[index];

                // return as a product tile - UI
                return ProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}

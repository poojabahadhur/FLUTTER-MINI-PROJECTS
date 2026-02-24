import 'package:ecommerce_2/components/buttons.dart';
import 'package:ecommerce_2/components/product.dart';
import 'package:ecommerce_2/components/shop.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Cart"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body:
          cart.isEmpty
              ? const Center(
                child: Text(
                  "Your cart is empty 🛒",
                  style: TextStyle(fontSize: 18),
                ),
              )
              : ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final Product product = cart[index];

                  return Card(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    child: ListTile(
                      title: Text(
                        product.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        product.description,
                        style: const TextStyle(fontSize: 14),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "₹${product.price}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              context.read<Shop>().removeFromCart(product);
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
    );
  }
}

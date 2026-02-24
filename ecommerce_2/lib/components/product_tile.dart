import 'package:ecommerce_2/components/buttons.dart';
import 'package:ecommerce_2/components/product.dart';
import 'package:ecommerce_2/components/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  const ProductTile({super.key, required this.product});

  // Function to show Add to Cart dialog
  void addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            content: const Text("Add this item to the cart?"),
            actions: [
              // Cancel button
              MyButton(
                child: const Text("Cancel"),
                onTap: () => Navigator.pop(context), // just close dialog
              ),

              // Save button (add to cart)
              MyButton(
                child: const Text("Yes"),
                onTap: () {
                  // add product to cart using Provider
                  context.read<Shop>().addToCart(product);

                  // close dialog after saving
                  Navigator.pop(context);
                },
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 233, 231, 231),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product image + name + description
          Column(
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  padding: const EdgeInsets.all(25),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Image.asset(product.imagepath),
                ),
              ),
              const SizedBox(height: 10),

              // Product name
              Text(
                product.name,
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              const SizedBox(height: 10),

              // Product description
              Text(
                product.description,
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 25),
            ],
          ),

          // Product price + Add to Cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.price.toStringAsFixed(2),
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
              MyButton(
                onTap: () => addToCart(context), // show dialog
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

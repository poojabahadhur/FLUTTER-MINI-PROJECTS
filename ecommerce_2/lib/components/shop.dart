import 'package:ecommerce_2/components/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // list of products available in the shop
  final List<Product> _shop = [
    Product(
      description: "sun protection",
      name: "GLASSES",
      price: 18000,
      imagepath: 'images/spects.jpg',
    ),
    Product(
      description: "twenty four by seven",
      name: "WATCH",
      price: 39999,
      imagepath: 'images/watch.jpg',
    ),
    Product(
      description: "formal touch up",
      name: "TIE",
      price: 7000,
      imagepath: 'images/tie.jpg',
    ),
    Product(
      description: "premium quality",
      name: "FOOTWEAR",
      price: 83599,
      imagepath: 'images/shoes.jpg',
    ),
  ];

  // list of products in the cart
  final List<Product> _cart = [];

  // getter for shop products
  List<Product> get shop => _shop;

  // getter for cart items
  List<Product> get cart => _cart;

  // ✅ add items to the cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners(); // notify UI
  }

  // ✅ remove items from the cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners(); // notify UI
  }
}

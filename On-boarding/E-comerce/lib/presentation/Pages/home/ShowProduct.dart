import 'package:flutter/material.dart';
import '../../widgets/ShopingCard.dart';

class ShowProduct extends StatelessWidget {
  final List<Map<String, dynamic>> products = [
    {  
      'assetPath': 'assets/boots.jpg',
      'name': 'Smartphone',
      'description': 'A high-end smartphone with a great camera.',
      'price': 0,
      'rating': 4,
    },
    {
      'assetPath': 'assets/boots.jpg',
      'name': 'Laptop',
      'description': 'A powerful laptop for gaming and work.',
      'price': 10,
      'rating': 4,
    },
    {
      'assetPath': 'assets/boots.jpg',
      'name': 'Headphones',
      'description': 'Noise-cancelling over-ear headphones.',
      'price': 0,
      'rating': 4,
    },
    {
      'assetPath': 'assets/boots.jpg',
      'name': 'Smartwatch',
      'description': 'A smartwatch with fitness tracking features.',
      'price': 2490,
      'rating': 4,
    },
    {
      'assetPath': 'assets/boots.jpg',
      'name': 'Tablet',
      'description': 'A lightweight tablet with a stunning display.',
      'price': 0,
      'rating': 4,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ShoppingCard(
            assetPath: product['assetPath'],
            name: product['name'],
            price: product['price'],
            rating: product['rating'],
            description: product['description'],
          );
        },
      ),
    );
  }
}

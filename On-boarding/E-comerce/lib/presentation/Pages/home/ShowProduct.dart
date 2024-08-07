import 'package:flutter/material.dart';
import '../../../Shared/ShopingCard.dart'; 

class ShowProduct extends StatelessWidget {
  List<Map<String, dynamic>> products = [
    {  
      'assetPath': 'assets/boots.jpg',
      'name': 'Smartphone',
      'description': 'A high-end smartphone with a great camera.',
      'price': 699.99,
      'rating': 4.5,
    },
    {
      'assetPath': 'assets/boots.jpg',

      'name': 'Laptop',
      'description': 'A powerful laptop for gaming and work.',
      'price': 1299.99,
      'rating': 4.7,
    },
    {
      'assetPath': 'assets/boots.jpg',
      'name': 'Headphones',
      'description': 'Noise-cancelling over-ear headphones.',
      'price': 199.99,
      'rating': 4,
    },
    {
      'assetPath': 'assets/boots.jpg',

      'name': 'Smartwatch',
      'description': 'A smartwatch with fitness tracking features.',
      'price': 249.99,
      'rating': 4.2,
    },
    {
      'assetPath': 'assets/boots.jpg',

      'name': 'Tablet',
      'description': 'A lightweight tablet with a stunning display.',
      'price': 399.99,
      'rating': 4.4,
    },
  ];




  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          ShoppingCard(
            assetPath: 'assets/boots.jpg', 
            name: 'Product Name',
            price: 99.99,
            rating: 5,
            description: 'Great',
          ),
          ShoppingCard(
            assetPath: 'assets/boots.jpg', 
            name: 'Another Product',
            price: 149.99,
            rating: 4,
            description: 'Excellent',
          ),
          ShoppingCard(
            assetPath: 'assets/boots.jpg', 
            name: 'Product Name',
            price: 99.99,
            rating: 5,
            description: 'Great',
          ),
        ],
      ),
    );
  }
}

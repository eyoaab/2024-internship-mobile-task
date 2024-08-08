import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child:  const Text(
        'A derby leather shoe is a classic and versatile footwear option characterized by its open lacing system, '
        'where the shoelace eyelets are sewn on top of the vamp (the upper part of the shoe). This design feature provides '
        'a more relaxed and casual look compared to the closed lacing system of oxford shoes. Derby shoes are typically '
        'made of high-quality leather, known for its durability and elegance, making them suitable for both formal and '
        'casual occasions. With their timeless style and comfortable fit, derby leather shoes are a staple in any well-rounded wardrobe.',
        style:  TextStyle(
          fontSize: 14,
          color: Colors.black87,
          height: 1.5,
        ),
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

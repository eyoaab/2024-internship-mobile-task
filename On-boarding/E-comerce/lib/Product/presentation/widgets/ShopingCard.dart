import 'package:flutter/material.dart';
import '../widgets/Widget_store.dart';

class ShoppingCard extends StatelessWidget {
  final String assetPath;
  final String name;
  final double price;
  final int rating;
  final String description;

  ShoppingCard({
    required this.assetPath,
    required this.name,
    required this.price,
    required this.rating,
    required this.description,
  });



  @override
  Widget build(BuildContext context) {
    return Card(
      margin: eadge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(
                assetPath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            space(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const  TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  '\$${price.toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 16, color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            space(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
               
                const Icon(
                  Icons.star,
                  color: Colors.amber,
                  size: 20,
                ),
                 Text(
                  '($rating)',
                  style: const TextStyle(fontSize: 16, color: const Color.fromARGB(255, 2, 2, 2), fontWeight: FontWeight.bold),
                ),
              ],
            ),
            space(10),
            Text(
              name,
              style: const  TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}

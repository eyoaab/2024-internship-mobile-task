import 'package:flutter/material.dart';
import '../../widgets/Widget_store.dart';

class Detailpageuppercomponent extends StatelessWidget {
  final String path;
  final String title;
  final String description;
  final double price;
  final double rating;

  const Detailpageuppercomponent({super.key, 
    required this.path,
    required this.title,
    required this.description,
    required this.price,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                path,
                fit: BoxFit.cover,
              ),
            ),
          ),
         space(16),
          Text(
            title,
            style: commonStyle,
          ),
          space(8),
          Text(
            description,
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
         space(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${price.toStringAsFixed(2)}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
              ),
              Row(
                children: [
                  Text(
                    rating.toStringAsFixed(1),
                    style: const TextStyle(fontSize: 16, color: Colors.amber),
                  ),
                 space(4),
                  const Icon(
                    Icons.star,
                    color: Colors.amber,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

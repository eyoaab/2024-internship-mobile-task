import 'package:flutter/material.dart';
import '../../widgets/Widget_store.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25.0),
              child: Image.asset(
                // 'assets/eyob.png',
                'assets/boots.jpg',
//
                height: 80,
                width: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'July 14, 2023',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
               space(8),
                const Text(
                  'Eyob Tariku',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
           const  SizedBox(width: 200),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
              child: const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}

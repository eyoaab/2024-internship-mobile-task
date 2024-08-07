import 'package:flutter/material.dart';
import 'DetailPageUpperComponent.dart';
import 'NumbersRow.dart';
import 'Description.dart';
import 'TwoButtons.dart';

class Detail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/');
          },
          child: Icon(Icons.arrow_back),
        ),
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Detailpageuppercomponent(
              path: 'assets/boots.jpg',
              title: 'Stylish Boots',
              description: 'These stylish boots are perfect for any occasion.',
              price: 120.00,
              rating: 4.5,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                height: 80,
                child: NumbersRow(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Description(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Twobuttons(),
            ),
          ],
        ),
      ),
    );
  }
}

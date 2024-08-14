import 'package:flutter/material.dart';

import '../../../domain/entitiy/product_entities.dart';
import 'Description.dart';
import 'DetailPageUpperComponent.dart';
import 'NumbersRow.dart';
import 'TwoButtons.dart';

class Detail extends StatelessWidget {
  final ProductEnities product;

  const Detail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
        title: const Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Detailpageuppercomponent(
              path: product.imageUrl,
              title: product.name, 
              description: product.description, 
              price: product.price,
              rating: 1, 
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
              child: Description(text: product.description), 
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Twobuttons( product: product,),
            ),
          ],
        ),
      ),
    );
  }
}

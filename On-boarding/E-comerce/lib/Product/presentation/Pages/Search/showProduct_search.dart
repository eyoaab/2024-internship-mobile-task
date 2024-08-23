import 'package:flutter/material.dart';
import '../../../domain/entitiy/product_entities.dart';
import '../../widgets/ShopingCard.dart';
import '../Detail/Detail.dart';

class SearchedProducts extends StatelessWidget {
  final List<ProductEnities> products;
  final String query;

  const SearchedProducts({
    Key? key,
    required this.products,
    required this.query,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Filter products based on the query
    final filteredProducts = products.where((product) {
      return product.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (filteredProducts.isEmpty) {
      return const Center(child: Text('No products found'));
    }

    return Expanded(
      child: ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          final product = filteredProducts[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Detail(product: product),
                ),
              );
            },
            child: ShoppingCard(
              assetPath: product.imageUrl,
              name: product.name,
              price: product.price,
              rating: 4, // Static rating
              description: product.description,
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product_bloc.dart';
import '../../bloc/product_event.dart';
import '../../bloc/product_state.dart';
import '../../widgets/ShopingCard.dart';

class ShowProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Triggering the LoadAllProductEvent to load the products
    context.read<ProductBloc>().add(const LoadAllProductEvent());
        
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is LoadingState) {
        print(" the state is loading");

          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedAllProductState) {
        print(" the state is loaded");

          return Expanded(
            child: ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final product = state.data[index];
                return ShoppingCard(
                  // assetPath: product.imageUrl,
                  assetPath: 'assets/boots.jpg',


                  name: product.name,
                  price: product.price,
                  rating: 2,
                  description: product.description,
                );
              },
            ),
          );
        } else if (state is ErrorState) {
        print(" the state is errr ${state}");

          return  Center(child: Text('Failed to load products: ${state.message}'));
        } else {
        print("no avaliuble state");

          return const Center(child: Text('No products available.'));
        }
      },
    );
  }
}

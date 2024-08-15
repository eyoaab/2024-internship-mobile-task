import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product_bloc.dart';
import '../../bloc/product_event.dart';
import '../../bloc/product_state.dart';
import '../../widgets/ShopingCard.dart';
import '../Detail/Detail.dart';

class ShowProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(const LoadAllProductEvent());


       return BlocBuilder<ProductBloc,ProductState>(
          builder:(context,state){

        if (state is LoadingState) {
       

          return const Center(child: CircularProgressIndicator());
        } else if (state is LoadedAllProductState) {
       

          return Expanded(
            child: ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                final product = state.data[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Detail(product: product),
                    ),
                      );
                  },
                
                child :ShoppingCard(                 
                  assetPath: product.imageUrl,
                  name: product.name,
                  price: product.price,
                  rating: 4,
                  description: product.description,
                ));
              },
            ),
          );
        } else if (state is ErrorState) {
      

          return  Center(child: Text('Failed to load products: ${state.message}'));
        } else if (state is DeletedState) {
          if (state.check){
            return  const Center(child: Text('Failed to delete product.'));
          }
          return  const Center(child: Text('Product deleted successfully.'));

        }
        else {
       

          return const Center(child: Text('No products available.'));
        }
      },
    );
  }
}

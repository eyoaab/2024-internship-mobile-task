import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entitiy/product_entities.dart';
import '../../bloc/product_bloc.dart';
import '../../bloc/product_event.dart';
import '../../bloc/product_state.dart';
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
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is DeletedState && state.check == true) {
            // showResponse(context, Icon(Icons.abc,),'product deleted successfully' );
           
            // ScaffoldMessenger.of(context).showSnackBar(
              // const SnackBar(content: Text('Product deleted successfully!')),
            // );

            print('deleted successfully');
            context.read<ProductBloc>().add(const LoadAllProductEvent());
            Navigator.pushNamed(context, '/home');
          }  else if (state is DeletedState && state.check == false) {
          
      // showResponse(context, Icon(Icons.abc,),'product not deleted successfully' );

            // Navigator.pop(context);
            print('not deleteddeleted successfully');
            // Navigator.pushNamed(context, '/home');




          }

          else if (state is ErrorState) {
            // Show error message
      // showResponse(context, const Icon(Icons.abc,),'error happend' );
              print('error occured ');
if (Navigator.canPop(context) && !Navigator.of(context).userGestureInProgress) {
  // Navigator.pushNamed(context, '/home');
}

          }
        },
        builder: (context, state) {
         

          return SingleChildScrollView(
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
                  child: Twobuttons(product: product),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entitiy/product_entities.dart';
import '../../bloc/product_bloc.dart';
import '../../bloc/product_event.dart';
import '../../bloc/product_state.dart';
import '../../widgets/Widget_store.dart';
import 'Description.dart';
import 'DetailPageUpperComponent.dart';
import 'NumbersRow.dart';
import 'TwoButtons.dart';


class Detail extends StatelessWidget {
  final ProductEnities product;

  const Detail({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/home');
            },
            child:  const Icon(Icons.chevron_left, color: Colors.blue,size:40),
      
          ),
          title: const Text('Product Details'),
        ),
        body: BlocConsumer<ProductBloc, ProductState>(
          listener: (context, state) {
            if (state is DeletedState && state.check == true) {
            
      
              Navigator.pushNamed(context, '/home');
              showMessage(context, const Icon(Icons.error), 'Product deleted  successfully');

            }  else if (state is DeletedState && state.check == false) {
              Navigator.pushNamed(context, '/home');
              showMessage(context, const Icon(Icons.error), 'Product not deleted');

            }
      
            else if (state is ErrorState) {
            
              showMessage(context, const Icon(Icons.error), state.message);

      
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
      ),
    );
  }
}

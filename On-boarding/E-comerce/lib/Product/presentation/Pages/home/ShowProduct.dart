import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/product_bloc.dart';
import '../../bloc/product_event.dart';
import '../../bloc/product_state.dart';
import '../../widgets/ShopingCard.dart';
import '../Detail/Detail.dart';

class ShowProduct extends StatefulWidget {
  @override
  State<ShowProduct> createState() => _ShowProductState();
}

class _ShowProductState extends State<ShowProduct> {
  @override
  void initState() {
    context.read<ProductBloc>().add(const LoadAllProductEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(const LoadAllProductEvent());
       return BlocConsumer<ProductBloc,ProductState>(
        listener: (context, state){
          if (state is ErrorState){
            showResponse(context,const Icon(Icons.error), 'Failed to load products');
          }
        },
          builder:(context,state)
          { return 

            state is LoadingState? const Column(
              mainAxisAlignment:MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,

              children:[CircularProgressIndicator()]):
            state is LoadedAllProductState? 
        Expanded(
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
          ):const Center(child: Text('Failed to load products'));
        } 
    );
  }
}



void showResponse(BuildContext context, Icon icin, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: icin,
        content: Text(
          message,
          style: const TextStyle(fontSize: 21),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () { 
            context.read<ProductBloc>().add(const LoadAllProductEvent());


              Navigator.of(context).pop();},

          child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

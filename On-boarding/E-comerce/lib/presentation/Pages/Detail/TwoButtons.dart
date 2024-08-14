import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entitiy/product_entities.dart';
import '../../bloc/product_bloc.dart';
import '../../bloc/product_event.dart';
import '../../widgets/Widget_store.dart';

class Twobuttons extends StatelessWidget {
 final ProductEnities product;

  const Twobuttons({Key? key, required this.product}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () { 
                // change state on bloc
               
                context.read<ProductBloc>().add(DeleteProductEvent(product.id));
                Navigator.pushNamed(context, '/');
              },
              style: ElevatedButton.styleFrom(),
              child: const Text('DELETE'),
            ),
            space(16),
            OutlinedButton(
              onPressed: () {
                 context.read<ProductBloc>().add(UpdateProductEvent(product));
               
                Navigator.pushNamed(context, '/');

              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.blue),
                backgroundColor: Colors.blue,
              ),
              child: const Text(
                'UPDATE',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

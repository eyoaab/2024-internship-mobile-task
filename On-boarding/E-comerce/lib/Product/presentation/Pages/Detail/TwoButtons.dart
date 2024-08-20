import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entitiy/product_entities.dart';
import '../../bloc/product_bloc.dart';
import '../../bloc/product_event.dart';
import '../../bloc/product_state.dart';
import '../../widgets/Widget_store.dart';
import '../UpdateProfile/UpdateProfile.dart';

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
                          // Trigger the delete product event
                          context.read<ProductBloc>().add(DeleteProductEvent(product.id));
                        },
                        style: ElevatedButton.styleFrom(),
                        child: const Text('DELETE'),
                      ),
                space(16),
                OutlinedButton(
                  onPressed: () {
                    // Navigate to the update profile page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateProfile(product: product),
                      ),
                    );
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
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      );
    },
  );
}

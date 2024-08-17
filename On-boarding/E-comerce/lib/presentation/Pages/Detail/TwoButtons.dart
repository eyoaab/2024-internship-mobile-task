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
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // change state on bloc

                    context
                        .read<ProductBloc>()
                        .add(DeleteProductEvent(product.id));
                    // showResponse(context, const Ic);
                    context
                        .read<ProductBloc>()
                        .add(const LoadAllProductEvent());

                    Navigator.pushNamed(context, '/');
                    showResponse(context, const Icon(Icons.info, size: 50,),'product deleted succesfully');
                  },
                  style: ElevatedButton.styleFrom(),
                  child: const Text('DELETE'),
                ),
                space(16),
                OutlinedButton(
                  onPressed: () {
                    //  context.read<ProductBloc>().add(UpdateProductEvent(product));

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
      },
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

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../data/model/ptoduct_to_save.dart';
import '../../../presentation/bloc/product_bloc.dart';
import '../../../presentation/bloc/product_event.dart';
import '../../../presentation/bloc/product_state.dart';
import '../../widgets/Widget_store.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _saveProduct() {
    if (_nameController.text.isNotEmpty &&
        _priceController.text.isNotEmpty &&
        _descriptionController.text.isNotEmpty &&
        _image != null) {

      final SendProduct productToSave = SendProduct(
        name: _nameController.text.trim(),
        description: _descriptionController.text.trim(),
        image: _image!,
        price: double.parse(_priceController.text.trim()),
      );

      context.read<ProductBloc>().add(AddProductEvent(productToSave));
    } else {
      showResponse(context, const Icon(Icons.error), 'Please fill in all fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AddState) {
          Navigator.pushNamed(context, '/');
           context.read<ProductBloc>().add(const LoadAllProductEvent());

          
          // showResponse(context, const Icon(Icons.check), 'Product added successfully');

          return const Placeholder();
        } else if (state is ErrorState) {
          return Center(
            child: Text('Error: ${state.message}'),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              leading: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
                child: const Icon(Icons.arrow_back, color: Colors.blue),
              ),
              title: const Text('Add Product'),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => _pickImage(ImageSource.gallery),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        child: _image == null
                            ? const Text('No image selected.')
                            : Image.file(_image!),
                      ),
                    ),
                  ),
                  space(20),
                  const Text('Name', style: styleText),
                  TextField(
                    controller: _nameController,
                    decoration: decorateInput,
                  ),
                  space(20),
                  const Text('Price', style: styleText),
                  TextField(
                    controller: _priceController,
                    decoration: decorateInput,
                    keyboardType: TextInputType.number,
                  ),
                  space(20),
                  const Text('Description', style: styleText),
                  TextField(
                    controller: _descriptionController,
                    decoration: decorateInput,
                    maxLines: 3,
                  ),
                  space(30),
                  Center(
                    child: Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: OutlinedButton(
                            onPressed: _saveProduct,
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 3, 77, 138),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: circular,
                            ),
                            child: const Text('ADD',
                                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255))),
                          ),
                        ),
                        space(10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: OutlinedButton(
                            onPressed: () {
                              setState(() {
                                _nameController.clear();
                                _priceController.clear();
                                _descriptionController.clear();
                                _image = null;
                              });
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.red, width: 2),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: circular,
                            ),
                            child: const Text('CLEAR', style: TextStyle(color: Colors.red)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

void showResponse(BuildContext context, Icon icon, String message) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        icon: icon,
        content: Text(message, style: const TextStyle(fontSize: 21)),
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

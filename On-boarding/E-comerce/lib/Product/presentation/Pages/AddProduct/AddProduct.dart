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

  void _clearAllFields() {
    setState(() {
      _nameController.clear();
      _priceController.clear();
      _descriptionController.clear();
      _image = null;
    });
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
      showMessage(context, const Icon(Icons.error), 'Please fill in all fields');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductBloc, ProductState>(
      listener: (context, state) {
        if (state is AddState) {
          if (state.check == true) {
            Navigator.pushNamed(context, '/home');
            showMessage(context, const Icon(Icons.check), 'Product added successfully');
          } else {
            Navigator.pushNamed(context, '/home');
            showMessage(context, const Icon(Icons.error), 'Product not added successfully');

          }
          _clearAllFields();
        } else if (state is ErrorState) {
          _clearAllFields();
          // Navigator.pushNamed(context, '/home');
          showMessage(context, const Icon(Icons.error), 'Error: ${state.message}');


        }
      },
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/home'),   
                child: const Icon(Icons.chevron_left, color: Colors.blue,size:40),
              ),
              title: const Text('Add Product',textAlign: TextAlign.end,),
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(25.0,0,25,15),
            

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () => _pickImage(ImageSource.gallery),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Center(
                        
                        child: _image == null
                            ? const Icon(Icons.camera_alt,size:55)
                            : Image.file(_image!,
                              width: double.infinity,
                              fit: BoxFit.cover),
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
                            onPressed: state is LoadingState ? null : _saveProduct,
                            style: OutlinedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(255, 3, 77, 138),
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              shape: circular,
                            ),
                            child: state is LoadingState
                                ? const CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                  )
                                : const Text('ADD', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        space(10),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: OutlinedButton(
                            onPressed: _clearAllFields,
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
          ),
        );
      },
    );
  }
}

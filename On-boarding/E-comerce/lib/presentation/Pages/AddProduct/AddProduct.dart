import 'package:flutter/material.dart';
import '../../widgets/Widget_store.dart';

class AddProduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/',);
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
            Container(
              height: 100,
              
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),


              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.image, size: 40, color: Colors.grey[700]),
                    space(10),
                    Text('Upload Image',
                        style: TextStyle(color: Colors.grey[700])),
                  ],
                ),
              ),
            ),
            space(20),
            
            const Text('Name',
                style: styleText),
            TextField(
              decoration: decorateInput,
            ),
            space(20),
           const  Text('Category',
                style: styleText),
            TextField(
              decoration: decorateInput,
            ),
            space(20),
            const Text('Price',
                style:  styleText),
            TextField(
              decoration: decorateInput,
              keyboardType: TextInputType.number,
            ),
            space(20),
            const Text('Description',
                style: styleText),
            TextField(
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
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 3, 77, 138),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: circular,
                      ),
                      child: const Text('ADD',
                          style: TextStyle(
                              color:  Color.fromARGB(255, 255, 255, 255))),
                    ),
                  ),
                  space(10),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color:red, width: 2),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: circular,
                      ),
                      child:
                          const Text('DELETE', style: TextStyle(color:red)),
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
}

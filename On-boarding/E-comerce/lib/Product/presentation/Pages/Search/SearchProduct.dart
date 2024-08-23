import 'package:flutter/material.dart';
import '../../../domain/entitiy/product_entities.dart';
import '../home/ShowProduct.dart';
import './showProduct_search.dart';
import 'searchComponent.dart';
import 'Catagory.dart';

class Search extends StatefulWidget {
  final List<ProductEnities> filtered;
  // final String query;

  const Search({Key? key, required this.filtered}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _query =  TextEditingController();
  void changed(){
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Search Product'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _query,
                   
  
                    decoration: InputDecoration(
                    
                      
                      hintText: 'Leather',
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[200],
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20.0),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 63, 81, 243),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    icon: const Icon(Icons.list, color: Colors.white),
                    padding: const EdgeInsets.all(16.0),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SearchedProducts(products: widget.filtered,query:_query.text),
          ),
          const SizedBox(height: 16),
           Catagory(),
        ],
      ),
    );
  }
}

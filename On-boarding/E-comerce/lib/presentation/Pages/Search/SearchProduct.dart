import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../home/ShowProduct.dart';
import 'searchComponent.dart';
import 'Catagory.dart';

class Searchproduct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),

            //  Icon(Icons.arrow_back),
            title: Text("Search Product")),
        body: Column(
          children: [SearchComponent(), ShowProduct(), Catagory()],
        ));
  }
}
import 'package:flutter/material.dart';

import '../../widgets/Widget_store.dart';
import 'ShowProduct.dart';
import 'profile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
        floatingActionButton: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/add');
          },
          child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Colors.blue),
            child: const Icon(
            Icons.add,
            size: 50,
            color:Colors.white,
          )  ,
          ),
          
        ),
        body: 
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Profile(),
               space(20),
                const Text(
                  'AVALIABLE PRODUCTS',
                  style: TextStyle(color: Colors.black, fontSize: 23),
                ),
                ShowProduct(),
              ],
            ),
          ),
        );
  }
}

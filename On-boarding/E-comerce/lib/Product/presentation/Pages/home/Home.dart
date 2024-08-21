import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../bloc/product_bloc.dart';
import '../../bloc/product_event.dart';
import '../../widgets/Widget_store.dart';
import 'ShowProduct.dart';
import 'profile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
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
            RefreshIndicator(
              onRefresh: () {
                context.read<ProductBloc>().add(const LoadAllProductEvent());
                return Future.delayed(const Duration(seconds: 2));
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Profile(),
                   space(20),
                      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        crossAxisAlignment: CrossAxisAlignment.start, 
      
        children: [
          Expanded(
            child: Text(
              'Available Products',
              style: GoogleFonts.poppins(
              fontSize: 19,
              fontWeight: FontWeight.w700,
              color: const Color.fromARGB(255, 0, 1, 8),
              ),
              textAlign: TextAlign.left,
            ),
          ),
           IconButton(onPressed: (){
            Navigator.pushNamed(context, '/search');

          }, icon: const Icon(
            Icons.search, 
            size: 30,
            color: Color.fromARGB(255, 0, 1, 8),
          )),
        ],
      ),
      
                    ShowProduct(),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}

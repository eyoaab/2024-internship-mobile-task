import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'injection_container.dart';
import 'presentation/Pages/AddProduct/AddProduct.dart';
import 'presentation/Pages/Search/SearchProduct.dart';
import 'presentation/Pages/home/Home.dart';

import 'presentation/bloc/product_bloc.dart';


void main() {
 
  setUp(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        
        BlocProvider<ProductBloc>(
          create: (context) => locator<ProductBloc>(), 
        ),
      ],  
      child: MaterialApp(
        initialRoute: '/',
        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case '/':
              builder = (BuildContext context) => Home();
              break;
            
            case '/add':
              builder = (BuildContext context) => AddProduct();
              break;
            case '/search':
              builder = (BuildContext context) => Searchproduct();
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) => builder(context),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          );
        },
      ),
    );
  }
}

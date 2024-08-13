import 'package:flutter/material.dart';

import 'presentation/Pages/AddProduct/AddProduct.dart';
import 'presentation/Pages/Detail/Detail.dart';
import 'presentation/Pages/Search/SearchProduct.dart';
import 'presentation/Pages/home/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case '/':
            builder = (BuildContext context) => Home();
            break;
          case '/detail':
            builder = (BuildContext context) => Detail();
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
    );
  }
}

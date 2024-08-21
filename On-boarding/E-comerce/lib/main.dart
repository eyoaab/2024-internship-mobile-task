import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Product/presentation/Pages/AddProduct/AddProduct.dart';
import 'Product/presentation/Pages/Search/SearchProduct.dart';
import 'Product/presentation/Pages/home/Home.dart';
import 'Product/presentation/bloc/product_bloc.dart';
import 'User/presentation/Pages/LogIn/login.dart';
import 'User/presentation/Pages/Signup/signup.dart';
import 'User/presentation/Pages/SplashScreen/splashScreen.dart';
import 'User/presentation/bloc/user_bloc.dart';
import 'injection_container.dart';




void main() async{
  WidgetsFlutterBinding.ensureInitialized();

 
 await setUp(); 
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create:(context)=>locator<UserBloc>()),
        
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
              builder = (BuildContext context) => SplashScreen();
              break;
            
            case '/add':
              builder = (BuildContext context) => AddProduct();
              break;
            case '/search':
              builder = (BuildContext context) => Searchproduct();
              break;
            case '/signUp':
                builder = (BuildContext context) => SignUpPage();
                break;
            case '/home':
                builder = (BuildContext context) => Home(); 
                break;  
             case '/login':
                builder = (BuildContext context) => LoginPage(); 
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

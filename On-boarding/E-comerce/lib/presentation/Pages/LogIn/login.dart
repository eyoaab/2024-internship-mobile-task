import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entitiy/user_entities.dart';
import '../../bloc/product_bloc.dart';
import '../../bloc/product_event.dart';
import '../../widgets/Widget_store.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  void logIn() async {
    final username = _usernameController.text;
    final password = _passwordController.text;

    if (username.isEmpty || password.isEmpty) {
      showMessage(context,  const Icon(Icons.info,size: 50,color:Colors.red), 'Please enter all fields');
      return;
    }
    else{
      UserEnities user = UserEnities(name: '',username: _usernameController.text,password: _passwordController.text,);
      context.read<ProductBloc>().add(LogInStateEvent(userEnities: user));

      
    }
 
  }


  void goTosignUpPage() {
    Navigator.pushNamed(context, '/signUp');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
            child: Center(
              child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 80.0),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'ECOM',
                  style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
              
                const Center(child:  Text('Sign in to your account',style: TextStyle(fontSize: 23),)),
                const SizedBox(height: 20),
                TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                    labelText: 'Username',
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: const Icon(Icons.person),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                    ),
                    prefixIcon: const Icon(Icons.lock),
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                onPressed: logIn,
                style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                    ),
                backgroundColor: Colors.blue,
                  ),
                child: const Text(
                'Login',
                style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 70),
                TextButton(
                onPressed: goTosignUpPage,
                child: const Text(
                "Don't have an account? Sign up",
                style: TextStyle(
                color: Colors.blue,
                    ),
                  ),
                ),
              ],
                        ),
                      ),
            ),
      ),
    );
  }
}

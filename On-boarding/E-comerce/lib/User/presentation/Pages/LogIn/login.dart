import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Product/presentation/widgets/Widget_store.dart';
import '../../../Domaign/Entities/user_entities.dart';
import '../../bloc/user_bloc.dart';
import '../../bloc/user_event.dart';
import '../../bloc/user_state.dart'; // Import the UserState

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
      showMessage(
        context,
        const Icon(Icons.info, size: 50, color: Colors.red),
        'Please enter all fields',
      );
      return;
    } else {
      UserEnities user = UserEnities(
        name: '',
        username: username,
        password: password,
      );
      context.read<UserBloc>().add(LoginEvent(userEnities: user));
      print('Login request sent from the page');
    }
  }

  void goToSignUpPage() {
    Navigator.pushNamed(context, '/signUp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserError) {
            showMessage(
              context,
              const Icon(Icons.error, size: 50, color: Colors.red),
              state.message,
            );
            _usernameController.clear();
            _passwordController.clear();
          } else if (state is UserLoggedIn) {
            if (state.isLogedin) {
              // showMessage(context, const Icon(Icons.info,size: 40,), 'U have signed succesfully');
              Navigator.pushReplacementNamed(context, '/home');
            } else {
              showMessage(
                context,
                const Icon(Icons.error, size: 50, color: Colors.red),
                'Login failed. Please try again.',
              );
             
              _usernameController.clear();
              _passwordController.clear();
              context.read<UserBloc>().add(UserInitialEvent()); 
            }
          }
        },
        builder: (context, state) {
          if (state is UserLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return SingleChildScrollView(
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
                    const Center(
                      child: Text(
                        'Sign in to your account',
                        style: TextStyle(fontSize: 23),
                      ),
                    ),
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
                      onPressed: goToSignUpPage,
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
          );
        },
      ),
    );
  }
}

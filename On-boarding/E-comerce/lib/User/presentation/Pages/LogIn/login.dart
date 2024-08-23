import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Product/presentation/widgets/Widget_store.dart';
import '../../../Domain/Entities/user_entities.dart';
import '../../bloc/user_bloc.dart';
import '../../bloc/user_event.dart';
import '../../bloc/user_state.dart'; 

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
         

          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 80.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 130,
                      decoration:  BoxDecoration(
                        boxShadow:  [ BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 2.0,
                              blurRadius: 5.0,
                              offset: const Offset(0.0, 4.0),
                            ),],
                          border: Border.all(
                          color: const Color.fromARGB(255, 0, 0, 0),
                          width: 1.0,
                          
                        ),
                    color: Colors.white, 
                    borderRadius: const  BorderRadius.all(Radius.circular(10),),
                    

                      ),
                      child:
                    
                     Text(
                        'ECOM',
                        style: GoogleFonts.caveatBrush(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: const Color.fromRGBO(63, 81, 243, 1),),
                      
                      textAlign: TextAlign.center,
                    ),
                  ),
                    const SizedBox(height: 40),
                     Center(
                      child: Text(
                        'Sign in to your account',
                        style: GoogleFonts.caveatBrush(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color:const  Color.fromARGB(255, 0, 0, 0),
                      ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                        labelText: 'Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        prefixIcon: const Icon(Icons.person,color:Color.fromARGB(255, 63, 81, 243)),
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
                        prefixIcon: const Icon(Icons.lock,color:Color.fromARGB(255, 63, 81, 243)),
                      ),
                    ),
                    const SizedBox(height: 40),
                   SizedBox(
                  width: double.infinity, 
                  child: ElevatedButton(    
                  onPressed: logIn,
                  style: ElevatedButton.styleFrom(       
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  ),
                  backgroundColor: const  Color.fromRGBO(63, 81, 243, 1),
                ),
                child: state is UserLoading
        ? const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          )
        :
                 const Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
            ,
            const SizedBox(height: 40,),
                    TextButton(
                onPressed: goToSignUpPage,
                child: RichText(
                  text:const  TextSpan(
                    text: "Don't have an account? ",
                    style:  TextStyle(
                      color: Colors.black, 
                      fontSize: 16,
                    ),
                    children: [
                      
                      TextSpan(
                        
                        text: 'Sign up',
                        style:  TextStyle(
                          color:  Color.fromRGBO(63, 81, 243, 1), 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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

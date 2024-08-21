import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../Product/presentation/widgets/Widget_store.dart';
import '../../../Domaign/Entities/user_entities.dart';
import '../../bloc/user_bloc.dart';
import '../../bloc/user_event.dart';
import '../../bloc/user_state.dart'; 

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isChecked = false;

  void signUp() {
    final name = _nameController.text;
    final username = _usernameController.text;
    final password = _passwordController.text;
    final confirmPassword = _confirmPasswordController.text;

    if(!_isChecked){
      showMessage(
        context,
        const Icon(Icons.info, size: 50, color: Colors.red),
        'Please agree to the terms and conditions',
      );
      return;
    }

    if (name.isEmpty || username.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      showMessage(
        context,
        const Icon(Icons.info, size: 50, color: Colors.red),
        'Please enter all fields',
      );
      return;
    } else if (password != confirmPassword) {
      showMessage(
        context,
        const Icon(Icons.info, size: 50, color: Colors.red),
        'Passwords do not match',
      );
      return;

    } else {
      UserEnities userToSave = UserEnities(
        name: name,
        username: username,
        password: password,
      );
      context.read<UserBloc>().add(SignUpEvent(userEnities: userToSave));
      return;
    }
  }

  void goToLoginPage() {
    Navigator.pushNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Color.fromRGBO(63, 81, 243, 1), 
            size: 40, 
          ),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
               Container(
                width: 50,
                decoration:  BoxDecoration(
                border: Border.all(
                color: const Color.fromARGB(255, 0, 0, 0),
                width: 1.0,
                    ),
                color: Colors.white, 
                borderRadius: const  BorderRadius.all(Radius.circular(10),),),
                        child:Text('ECOM',
                        style: GoogleFonts.caveatBrush(
                        fontSize: 20,
                        fontWeight: FontWeight.w200,
                        color: const Color.fromRGBO(63, 81, 243, 1),),
                        textAlign: TextAlign.center,
                    ),
                  ),
              const SizedBox(width: 60),
            ],
          ),
        ],
      ),
      body: BlocConsumer<UserBloc, UserState>(
        listener: (context, state) {
          if (state is UserError) {
            // print(state.message);
              context.read<UserBloc>().add(UserInitialEvent()); 

            showMessage(
              context,
              const Icon(Icons.error, size: 50, color: Colors.red),
              state.message,
            );

          } else if (state is UserSignedUp) {
            if (state.isSignedUp) {
              Navigator.pushReplacementNamed(context, '/login');
               showMessage(
                context,
                const Icon(Icons.check, size: 50, color: Color.fromARGB(255, 60, 244, 54)),
                'U have signed successfully ',
              );
            } else {
              // context.read<UserBloc>().add(UserInitialEvent()); 
              Navigator.pushReplacementNamed(context, '/signUp');


              showMessage(
                context,
                const Icon(Icons.error, size: 50, color: Colors.red),
                'Sign up failed. Please try again.',
              );
            }
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                   Center(
                      child: Text(
                        'Create your account',
                        style: GoogleFonts.caveatBrush(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color:const  Color.fromARGB(255, 0, 0, 0),
                      ),
                      ),
                    ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: const Icon(Icons.person,color:Color.fromARGB(255, 63, 81, 243)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      labelText: 'Email',
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
                  const SizedBox(height: 20),
                  TextField(
                    controller: _confirmPasswordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      prefixIcon: const Icon(Icons.lock,color:Color.fromARGB(255, 63, 81, 243)),
                    ),
                  ),
                  const SizedBox(height: 15),
                   Row(
                children: <Widget>[
                  Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                  setState(() {
                    _isChecked = value ?? false;
                  });
        },
        ),
         RichText(
                  text:const  TextSpan( 
                    text: 'I understood ',
                    style:  TextStyle(
                      color: Colors.black, 
                      fontSize: 16,
                    ),
                    children: [
                      
                      TextSpan(
                        
                        text: ' terms & policy',
                        style:  TextStyle(
                          color: Color.fromARGB(255, 63, 81, 243), 
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
      ],
    ),

  ElevatedButton(
                    onPressed: signUp,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor:Color.fromARGB(255, 63, 81, 243),
                    ),
              child: state is UserLoading
                  ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ):const Text(
                      'Sign Up',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 45),
                  TextButton(
                onPressed: goToLoginPage,
                child: RichText(
                  text:const  TextSpan( 
                    text: 'Have an account?  ',
                    style:  TextStyle(
                      color: Colors.black, 
                      fontSize: 16,
                    ),
                    children: [
                      
                      TextSpan(
                        
                        text: 'Sign in',
                        style:  TextStyle(
                          color: Color.fromARGB(255, 63, 81, 243), 
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
          );
        },
      ),
    );
  }
}

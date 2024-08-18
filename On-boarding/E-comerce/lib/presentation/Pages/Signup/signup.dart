import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entitiy/user_entities.dart';
import '../../bloc/product_bloc.dart';
import '../../bloc/product_event.dart';
import '../../widgets/Widget_store.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _name = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpassword = TextEditingController();


  void signUp() async {
    final name = _name.text;
    final username = _usernameController.text;
    final password = _passwordController.text;
    final confirmpassword = _confirmpassword.text;

    if (username.isEmpty || password.isEmpty || confirmpassword.isEmpty|| name.isEmpty) {
      showMessage(context,  const Icon(Icons.info,size: 50,color:Colors.red), 'Please enter all fields');
      return;
    }
    else if (password != confirmpassword) {
      showMessage(context,const Icon(Icons.info,size: 50,color:Colors.red), 'Passwords do not match');
      return;
    } else{
      UserEnities userTosave = UserEnities(
        name: name,
        username: username,
        password: password,
      );
      print('up to send the request from signin page');

      context.read<ProductBloc>().add(SignInEvent(userEnities: userTosave));
      print('u[dated the user add event]');


      
    }
  }

  

  void gotoLoginpage() {
    Navigator.pushNamed(context, '/');

  }

  void goToHomePage() {
    Navigator.pushNamed(context, '/Login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: const Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),
      actions:  [ Row(
        mainAxisAlignment: MainAxisAlignment.end  ,
        children: [
         
              Container(
                
                padding: const EdgeInsets.fromLTRB(20,5,20,5),
              decoration:const  BoxDecoration(color: Color.fromARGB(255, 207, 202, 202),
              borderRadius: BorderRadius.all(Radius.circular(10))
              
              ,
              border: Border(top:BorderSide(color:Colors.black),
              left:BorderSide(color:Colors.black),
              right:BorderSide(color:Colors.black),
              bottom:BorderSide(color:Colors.black),)),
              child: const Text('ECOM',style: TextStyle(color:Color.fromARGB(255, 7, 123, 218),fontSize: 21,fontWeight: FontWeight.bold),)),
          
           const SizedBox(width: 60,),
        ],
      )],),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[

              const Text(
                  'Sign Up',
                  style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
                  TextField(
                  controller: _name,
                  decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  ),
                  prefixIcon: const Icon(Icons.person),
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
              const SizedBox(height: 20),
              TextField(
                controller: _confirmpassword,
                obscureText: true,
                decoration: InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                ),
                  prefixIcon: const Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 30),
             
              ElevatedButton(
                onPressed: signUp,
                style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                  ),
                backgroundColor: Colors.blue,
                ),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              TextButton(
                  onPressed: gotoLoginpage,
                  child: const Text(
                  'Do U have an account? Log in ',
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
  }
}

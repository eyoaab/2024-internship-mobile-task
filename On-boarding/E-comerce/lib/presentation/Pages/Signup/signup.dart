import 'package:flutter/material.dart';
import '../../widgets/Widget_store.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpassword = TextEditingController();


  void signUp() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final confirmpassword = _confirmpassword.text;

    if (username.isEmpty || password.isEmpty || confirmpassword.isEmpty) {
      showMessage(context,  const Icon(Icons.info,size: 50,color:Colors.red), 'Please enter all fields');
      return;
    }
    else if (password != confirmpassword) {
      showMessage(context,const Icon(Icons.info,size: 50,color:Colors.red), 'Passwords do not match');
      return;
    } else{
      
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 80.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              const SizedBox(height: 20),
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

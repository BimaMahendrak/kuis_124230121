import 'package:flutter/material.dart';
import '../view/homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _username = TextEditingController();
  final _password = TextEditingController();
  bool isLoginSuccess = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page baru'),
        backgroundColor: const Color.fromARGB(255, 73, 132, 180),
      ),
      body: Center(
        child: Column(
          children: [
            _usernameField(),
            _passwordField(),
            _loginButton(context),
            ElevatedButton(
              onPressed: () {
                _username.clear();
                _password.clear();
              },
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _usernameField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
              color: (isLoginSuccess) ? Colors.blue : Colors.red,
            ),
          ),
          labelText: 'Username',
        ),
        controller: _username,
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            borderSide: BorderSide(
              color: (isLoginSuccess) ? Colors.blue : Colors.red,
            ),
          ),
          labelText: 'Password',
        ),
        controller: _password,
      ),
    );
  }

  Widget _loginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: () {
          String text = '';
          setState(() {
            if (_username.text == 'admin' && _password.text == '121') {
              text = 'Login Successful';
              isLoginSuccess = true;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => Homepage(username: _username.text, text: text,),
                ),
              );
            } else {
              text = 'Login Failed';
              isLoginSuccess = false;
            }

            SnackBar snackBar = SnackBar(content: Text(text));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: (isLoginSuccess) ? Colors.blue : Colors.red,
          foregroundColor: Colors.white,
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
        child: const Text(
          'Login',
          style: TextStyle(color: Color.fromARGB(255, 254, 254, 254)),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'screens/login_screen.dart';

class App extends StatelessWidget {
  Widget build(context) {
      return MaterialApp(
          home: Scaffold(
            body: LoginScreen(

            ),
            appBar: AppBar(
              title: Text('Login'),
              backgroundColor: Colors.red,
            ),
          ),
      );
  }
}
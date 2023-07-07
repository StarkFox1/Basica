<<<<<<< HEAD
=======
//import 'package:basica/screens/splash.dart';
>>>>>>> 521a2aeca03e68076eac85b50034f65c778ecc37
import 'package:basica/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const Save_key = 'UserLoggedIn';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login Page',
        theme: ThemeData(primarySwatch: Colors.green),
        home: WelcomeScreen());
  }
}
//hi
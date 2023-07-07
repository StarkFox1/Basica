import 'package:basica/screens/splash.dart';
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
        home: screenSplash());
  }
}
//hi
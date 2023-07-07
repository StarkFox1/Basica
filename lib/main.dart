import 'package:basica/firebase_options.dart';
import 'package:basica/screens/authentication_repository.dart';
import 'package:basica/screens/welcome_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((Value) => Get.put(AuthenticationRepository()));
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
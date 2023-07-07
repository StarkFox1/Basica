import 'package:basica/main.dart';
import 'package:basica/screens/home.dart';
import 'package:basica/screens/login.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class screenSplash extends StatefulWidget {
  const screenSplash({super.key});

  @override
  State<screenSplash> createState() => _screenSplashState();
}

class _screenSplashState extends State<screenSplash> {
  @override
  void initState() {
    checkUserLoggedin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/Basica_Logo.jpg'),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => LoginScreen()));
  }

  Future<void> checkUserLoggedin() async {
    final _sharedpref = await SharedPreferences.getInstance();
    final _userlogged = _sharedpref.getBool(Save_key);
    if (_userlogged == null || _userlogged == false) {
      gotoLogin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    }
  }
}

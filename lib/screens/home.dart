import 'package:basica/login/login.dart';
import 'package:basica/screens/bottomnavigation/account.dart';
import 'package:basica/screens/bottomnavigation/list.dart';
import 'package:basica/screens/bottomnavigation/main_screen.dart';
import 'package:basica/screens/bottomnavigation/search.dart';
import 'package:flutter/material.dart';
import 'package:fluttericon/entypo_icons.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  _ontap(int index) {
    Navigator.of(context)
        .push(MaterialPageRoute<Null>(builder: (BuildContext context) {
      return _pages[_currentstate];
    }));
  }

  int _currentstate = 0;

  final _pages = [
    const ScreenMain(),
    const SearchScreen(),
    const ShoppingList(),
    AccountDetailsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
                onPressed: () {
                  signout(context);
                },
                icon: const Icon(Entypo.logout))
          ],
        ),
        body: _pages[_currentstate],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentstate,
          onTap: (newIndex) {
            setState(() {
              _currentstate = newIndex;
            });
          },
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Shop list'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
          ],
        ));
  }

  signout(BuildContext ctx) async {
    final _sharedpref = await SharedPreferences.getInstance();
    await _sharedpref.clear();
    Navigator.of(ctx).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginScreen()),
        (route) => false);
  }
}

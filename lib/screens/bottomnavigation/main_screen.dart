import 'package:basica/screens/widgets/drinks_carousel.dart';
import 'package:basica/screens/widgets/grocery_carousel.dart';
import 'package:flutter/material.dart';

class ScreenMain extends StatelessWidget {
  const ScreenMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Grocery_carousel()),
    );
  }
}

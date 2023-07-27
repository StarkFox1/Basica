import 'package:basica/login/assets/images.dart';
import 'package:basica/login/widgets/login_footer_widget.dart';
import 'package:basica/login/widgets/login_form_widget.dart';
import 'package:basica/login/widgets/login_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:basica/login/assets/sizes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Get the size in LoginHeaderWidget()
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(tWelcomeScreenImage),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                  gradient:
                      LinearGradient(begin: Alignment.bottomRight, colors: [
                Colors.white.withOpacity(.9),
                Colors.white.withOpacity(.8),
                Colors.white.withOpacity(.5),
              ])),
              child: const Padding(
                padding: EdgeInsets.all(tDefaultSize),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LoginHeaderWidget(),
                    LoginForm(),
                    LoginFooterWidget(),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}

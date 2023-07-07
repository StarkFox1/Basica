import 'package:basica/login/form_header_widget.dart';
import 'package:basica/login/widgets/signup_footer_widget.dart';
import 'package:basica/login/widgets/signup_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:basica/login/assets/sizes.dart';
import 'package:basica/login/assets/text.dart';
import 'package:basica/login/assets/images.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: const [
                FormHeaderWidget(
                  image: tWelcomeScreenImage,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                  imageHeight: 0.15,
                ),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

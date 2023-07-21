import 'package:basica/login/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:basica/login/assets/text.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);
//commit
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => SignUpScreen())));
          },
          child: Text.rich(
            TextSpan(
                text: tDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyLarge,
                children: const [
                  TextSpan(
                      text: tSignup,
                      style: TextStyle(color: Color.fromARGB(255, 37, 157, 87)))
                ]),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:basica/assets/colors.dart';
import 'package:basica/assets/sizes.dart';
import 'package:basica/assets/text.dart';
import 'package:basica/assets/images.dart';
import 'login.dart';
import 'signup_screen.dart';
=======
import 'package:basica/login/assets/colors.dart';
import 'package:basica/login/assets/sizes.dart';
import 'package:basica/login/assets/text.dart';
import 'package:basica/login/assets/images.dart';
>>>>>>> 521a2aeca03e68076eac85b50034f65c778ecc37

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    final isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? tSecondaryColor : tPrimaryColor,
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
<<<<<<< HEAD
              image: const AssetImage(tWelcomeScreenImage),
              height: height * 0.6,
            ),
=======
                image: const AssetImage(tGoogleLogoImage),
                height: height * 0.6),
>>>>>>> 521a2aeca03e68076eac85b50034f65c778ecc37
            Column(
              children: [
                Text(
                  tWelcomeTitle,
                  style: Theme.of(context).textTheme.headline3,
                ),
                Text(
                  tWelcomeSubTitle,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                    },
                    child: Text(tLogin.toUpperCase()),
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpScreen(),
                        ),
                      );
                    },
                    child: Text(tSignup.toUpperCase()),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

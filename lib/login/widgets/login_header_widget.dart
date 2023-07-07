import 'package:flutter/material.dart';
import 'package:basica/login/assets/text.dart';
import 'package:basica/login/assets/images.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            image: const AssetImage(tGoogleLogoImage),
            height: size.height * 0.2),
        //Text(tLoginTitle, style: Theme.of(context).textTheme.headline1),
        Text(
          tLoginSubTitle,
          style: Theme.of(context).textTheme.displaySmall,
          selectionColor: Color.fromARGB(255, 5, 131, 214),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class LoginSocialIcons extends StatelessWidget {
  const LoginSocialIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlutterSocialButton(
          onTap: () {},
          mini: true,
          buttonType: ButtonType.facebook,
        ),
        FlutterSocialButton(
          onTap: () {},
          mini: true,
          buttonType: ButtonType.google,
        ),
        FlutterSocialButton(
          onTap: () {},
          mini: true,
          buttonType: ButtonType.phone,
        ),
      ],
    );
  }
}

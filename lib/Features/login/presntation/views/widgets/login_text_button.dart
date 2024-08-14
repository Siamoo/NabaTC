
import 'package:flutter/material.dart';

class LoginTextButton extends StatelessWidget {
  const LoginTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: TextButton.styleFrom(
            foregroundColor: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, 'SignPage');
        },
        child: const Text(
          'Don’t have an account? Sign Up',
        ),
      ),
    );
  }
}

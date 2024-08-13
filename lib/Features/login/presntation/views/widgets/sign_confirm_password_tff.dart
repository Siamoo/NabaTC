
import 'package:flutter/material.dart';

class SignConfirmPasswordTFF extends StatelessWidget {
  const SignConfirmPasswordTFF({
    super.key,
    required this.passwordController,
  });

  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: passwordController,
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff00dfc0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xff00dfc0)),
        ),
        hintText: 'Enter Confirm password',
      ),
      obscureText: true,
      validator: (value) {
        if (value != passwordController.text || value == null || value.isEmpty ) {
          return 'password not same ';
        }
        return null;
      },
    );
  }
}

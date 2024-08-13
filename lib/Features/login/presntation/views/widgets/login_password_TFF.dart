import 'package:flutter/material.dart';

class LoginPasswordTFF extends StatelessWidget {
  const LoginPasswordTFF({
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
        hintText: 'Enter your password',
      ),
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        return null;
      },
    );
  }
}

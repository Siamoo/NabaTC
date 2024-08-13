import 'package:flutter/material.dart';

class LoginElevatedButtonCustom extends StatelessWidget {
  const LoginElevatedButtonCustom({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.screenWidth,
    required this.text,
    required this.isLoading,
  });
  final bool isLoading;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final double screenWidth;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff00dfc0),
            foregroundColor: Colors.black),
        onPressed: () async {
          if (Form.of(context).validate()) {}
        },
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Text(text),
      ),
    );
  }
}

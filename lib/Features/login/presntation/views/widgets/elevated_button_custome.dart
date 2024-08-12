
import 'package:flutter/material.dart';

class ElevatedButtonCustom extends StatelessWidget {
  const ElevatedButtonCustom({
    super.key,
    required this.emailController,
    required this.passwordController, required this.screenWidth,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final double screenWidth ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth *.25),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff00dfc0),
          foregroundColor: Colors.black
        ),
        onPressed: () async {
          if (Form.of(context).validate()) { }
        },
        child: const Text('Log In'),
      ),
    );
  }
}

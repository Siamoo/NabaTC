import 'package:firebase1/Features/login/presntation/views/widgets/elevated_button_custome.dart';
import 'package:firebase1/Features/login/presntation/views/widgets/login_email_TFF.dart';
import 'package:firebase1/Features/login/presntation/views/widgets/login_logo.dart';
import 'package:firebase1/Features/login/presntation/views/widgets/login_social_icons.dart';
import 'package:firebase1/Features/login/presntation/views/widgets/sign_confirm_password_tff.dart';
import 'package:firebase1/Features/login/presntation/views/widgets/sign_password_tff.dart';
import 'package:flutter/material.dart';

class SignPageBody extends StatelessWidget {
  const SignPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * .05),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LoginLogo(
                  screenWidth: screenWidth,
                  logPath: 'asset/images/signin.jpg',
                ),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                LoginAndSigninEmailTFF(emailController: emailController),
                const SizedBox(height: 16),
                const Text(
                  'Password',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                SignPasswordTFF(passwordController: passwordController),
                const SizedBox(height: 16),
                const Text(
                  'Confirm Password',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                SignConfirmPasswordTFF(passwordController: passwordController),
                const SizedBox(height: 20),
                ElevatedButtonCustom(
                  emailController: emailController,
                  passwordController: passwordController,
                  screenWidth: screenWidth,
                  text: 'Sign In',
                ),
                const SizedBox(height: 30),
                const LoginSocialIcons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

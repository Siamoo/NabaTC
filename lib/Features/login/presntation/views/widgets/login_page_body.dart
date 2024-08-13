import 'package:firebase1/Features/login/presntation/views/widgets/signin_elevated_button_custome.dart';
import 'package:firebase1/Features/login/presntation/views/widgets/login_email_tff.dart';
import 'package:firebase1/Features/login/presntation/views/widgets/login_logo.dart';
import 'package:firebase1/Features/login/presntation/views/widgets/login_password_tff.dart';
import 'package:firebase1/Features/login/presntation/views/widgets/login_social_icons.dart';
import 'package:flutter/material.dart';

class LoginPageBody extends StatelessWidget {
  const LoginPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * .05),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LoginLogo(screenWidth: screenWidth, logPath: 'asset/images/login.jpg',),
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
                LoginPasswordTFF(passwordController: passwordController),
                const SizedBox(height: 20),
                SigninElevatedButtonCustom(
                  emailController: emailController,
                  passwordController: passwordController,
                  screenWidth: screenWidth, text: 'Log in', isLoading: true,
                ),
                Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'SignPage');
                    },
                    child: const Text('Don’t have an account? Sign Up',),
                  ),
                ),
                const SizedBox(height: 50),
                const LoginSocialIcons(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

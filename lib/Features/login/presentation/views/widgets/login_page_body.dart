import 'dart:developer';

import 'package:firebase1/Features/login/presentation/manger/login%20cubit/login_cubit.dart';
import 'package:firebase1/Features/login/presentation/views/widgets/login_elevated_button_custome.dart';
import 'package:firebase1/Features/login/presentation/views/widgets/login_email_tff.dart';
import 'package:firebase1/Features/login/presentation/views/widgets/login_logo.dart';
import 'package:firebase1/Features/login/presentation/views/widgets/login_password_tff.dart';
import 'package:firebase1/Features/login/presentation/views/widgets/login_social_icons.dart';
import 'package:firebase1/Features/login/presentation/views/widgets/login_text_button.dart';
import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:firebase1/core/helpers/show_snacke_bar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * .05),
        child: Form(
          child: SingleChildScrollView(
            child: BlocConsumer<LoginCubit, LoginState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushReplacementNamed(context, 'ZoomDrawerPages');
                } else if (state is LoginGoogleSuccess) {
                  Navigator.pushReplacementNamed(context, 'ZoomDrawerPages');
                } else if (state is LoginFaceBookleSuccess) {
                  Navigator.pushReplacementNamed(context, 'ZoomDrawerPages');
                }  else if (state is LoginFailure) {
                  log(state.errMessage);
                  showSnackBarHelpers(context, state.errMessage);
                }
              },
              builder: (context, state) {
                return AbsorbPointer(
                  absorbing: (state is LoginLoading) ? true : false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      LoginLogo(
                        screenWidth: screenWidth,
                        logPath: 'asset/images/LoginPage.png',
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        'Email',
                        style: TextStyle(fontSize: 16,color: kWhiteColor),
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
                      LoginElevatedButtonCustom(
                        emailController: emailController,
                        passwordController: passwordController,
                        screenWidth: screenWidth,
                        text: 'Log in',
                        isLoading: (state is LoginLoading) ? true : false,
                      ),
                      const LoginTextButton(),
                      const SizedBox(height: 50),
                      LoginSocialIcons(
                        isLoading: (state is LoginLoading) ? true : false,
                        screenWidth: screenWidth,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

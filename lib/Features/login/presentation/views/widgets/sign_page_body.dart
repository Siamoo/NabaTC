import 'package:firebase1/Features/login/presentation/manger/signin%20cubit/signin_cubit.dart';
import 'package:firebase1/Features/login/presentation/views/widgets/login_email_tff.dart';
import 'package:firebase1/Features/login/presentation/views/widgets/signin_elevated_button_custome.dart';
import 'package:firebase1/Features/login/presentation/views/widgets/login_logo.dart';
import 'package:firebase1/Features/login/presentation/views/widgets/sign_confirm_password_tff.dart';
import 'package:firebase1/Features/login/presentation/views/widgets/sign_password_tff.dart';
import 'package:firebase1/constant.dart';
import 'package:firebase1/core/helpers/show_snacke_bar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignPageBody extends StatelessWidget {
  const SignPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    final TextEditingController consfirmPasswordController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        backgroundColor: kPrimaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * .05),
        child: Form(
          child: SingleChildScrollView(
            child: BlocConsumer<SigninCubit, SigninState>(
              listener: (context, state) {
                if (state is SigninSuccess) {
                  // showSnackBarHelpers(context, state.succMessage);
                  Navigator.pushNamed(context, 'LoginPage');
                } else if (state is SigninFailure) {
                  showSnackBarHelpers(context, state.errMessage);
                }
              },
              builder: (context, state) {
                return AbsorbPointer(
                  absorbing: (state is SigninLoading) ? true : false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      LoginLogo(
                        screenWidth: screenWidth,
                        logPath: 'asset/images/signin.png',
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
                      SignConfirmPasswordTFF(
                        passwordController: passwordController,
                        consfirmPasswordController: consfirmPasswordController,
                      ),
                      const SizedBox(height: 20),
                      SigninElevatedButtonCustom(
                        emailController: emailController,
                        passwordController: passwordController,
                        screenWidth: screenWidth,
                        text: 'Sign In',
                        isLoading: (state is SigninLoading) ? true : false,
                      ),
                      const SizedBox(height: 30),
                       
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

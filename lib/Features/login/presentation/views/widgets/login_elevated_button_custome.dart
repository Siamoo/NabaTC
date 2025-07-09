import 'package:firebase1/Features/login/presentation/manger/login%20cubit/login_cubit.dart';
import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            backgroundColor:kWhiteColor,
            foregroundColor: kPrimaryColor),
        onPressed: () async {
          if (Form.of(context).validate()) {
            BlocProvider.of<LoginCubit>(context).login(
              email: emailController.text,
              password: passwordController.text,
            );
          }
        },
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              )
            : Text(text,
            style:const TextStyle(fontWeight: FontWeight.w700),),
      ),
    );
  }
}

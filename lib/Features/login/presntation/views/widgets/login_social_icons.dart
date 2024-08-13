import 'package:firebase1/Features/login/presntation/manger/login_cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class LoginSocialIcons extends StatelessWidget {
  const LoginSocialIcons({
    super.key, required this.isLoading, required this.screenWidth,
  });
final bool isLoading ;
final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return (isLoading) ? Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth*.4),
          child: const CircularProgressIndicator(),
        )
        :  Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FlutterSocialButton(
          onTap: () {BlocProvider.of<LoginCubit>(context).signInWithFacebook();},
          mini: true,
          buttonType: ButtonType.facebook,
        ),
        FlutterSocialButton(
          onTap: () {BlocProvider.of<LoginCubit>(context).signInWithGoogle();},
          mini: true,
          buttonType: ButtonType.google,
        ),
        FlutterSocialButton(
          onTap: () {},
          mini: true,
          buttonType: ButtonType.phone,
        ),
      ],
    );
  }
}

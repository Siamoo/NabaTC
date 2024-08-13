import 'package:firebase1/Features/login/presntation/manger/signin_cubit/signin_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_button/flutter_social_button.dart';

class SigninSocialIcons extends StatelessWidget {
  const SigninSocialIcons({
    super.key, required this.isLoading, required this.screenWidth,
  });
final bool isLoading ;
final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SigninCubit, SigninState>(
      builder: (context, state) {
        return (isLoading) ? Padding(
          padding:  EdgeInsets.symmetric(horizontal: screenWidth*.4),
          child: const CircularProgressIndicator(),
        )
        : Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FlutterSocialButton(
              onTap: () {},
              mini: true,
              buttonType: ButtonType.facebook,
            ),
            FlutterSocialButton(
              onTap: () {BlocProvider.of<SigninCubit>(context).signInWithGoogle();},
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
      },
    );
  }
}

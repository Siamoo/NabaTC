import 'package:firebase1/Features/login/presntation/manger/phone%20cubit/phone_cubit.dart';
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPElevatedButton extends StatelessWidget {
  const OTPElevatedButton({
    super.key,
    required this.otpController,
    required this.isLoading,
  });

  final TextEditingController otpController;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return ElevatedButton(
        onPressed: () {
          String otp = otpController.text;
          BlocProvider.of<PhoneCubit>(context).verifyOtp(otp);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kWhiteColor, // background (button) color
        ),
        child: isLoading
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
              )
            : const Text(
                'Verify',
                style: TextStyle(color: kPrimaryColor,fontWeight: FontWeight.w700 ),
              ),
      );
    });
  }
}

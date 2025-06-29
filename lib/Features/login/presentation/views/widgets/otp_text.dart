
import 'package:firebase1/Features/login/presentation/views/otp_page.dart';
import 'package:flutter/material.dart';

class OTPText extends StatelessWidget {
  const OTPText({
    super.key,
    required this.widget,
  });

  final OtpPage widget;

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Please enter the 6-digit OTP sent to your Phone',
      style: TextStyle(fontSize: 18),
      textAlign: TextAlign.center,
    );
  }
}



import 'package:flutter/material.dart';

class PhoneLogo extends StatelessWidget {
  const PhoneLogo({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'asset/images/otp.png',
      width: screenWidth * .5,
      height: screenWidth * .5,
    );
  }
}

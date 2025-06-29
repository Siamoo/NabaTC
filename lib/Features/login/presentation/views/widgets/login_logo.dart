
import 'package:flutter/material.dart';

class LoginLogo extends StatelessWidget {
  const LoginLogo({
    super.key,
    required this.screenWidth, required this.logPath,
  });

  final double screenWidth;
  final String logPath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * .15,),
      child: Container(
        width: screenWidth * .5,
        height: screenWidth * .5,
        decoration: BoxDecoration(
          image:  DecorationImage(
            image: AssetImage(logPath),
            fit: BoxFit.fill,
          ),
          borderRadius: BorderRadius.circular(
              40), 
        ),
      ),
    );
  }
}

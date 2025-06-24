
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAskImage extends StatelessWidget {
  const CustomAskImage({
    super.key,
    required this.screenWidth,
  });

  final dynamic screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Ask about disease",
          style: GoogleFonts.bangers(
              textStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: kWhiteColor)),
        ),
        Container(
          width: screenWidth * 2,
          height: screenWidth * 1.5,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/images/ask.png'),
              fit: BoxFit.fill,
            ),
            // Optional: adds rounded corners
          ),
        ),
      ],
    );
  }
}

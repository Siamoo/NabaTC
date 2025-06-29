import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAiImage extends StatelessWidget {
  const CustomAiImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * .5;
    return Column(
      children: [
        Text(
          "select tomato image",
          style: GoogleFonts.bangers(
              textStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: kWhiteColor)),
        ),
        Container(
          width: screenWidth * 2,
          height: screenWidth * 2,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/images/upload.png'),
              fit: BoxFit.fill,
            ),
            // Optional: adds rounded corners
          ),
        ),
      ],
    );
  }
}

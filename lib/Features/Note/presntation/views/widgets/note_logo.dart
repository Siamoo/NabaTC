import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteLogo extends StatelessWidget {
  const NoteLogo({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Add any note",
          style: GoogleFonts.bangers(
              textStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: kWhiteColor)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * .15, vertical: screenWidth * .05),
          child: Container(
            width: screenWidth * .6,
            height: screenWidth * .5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('asset/images/Addnotes.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

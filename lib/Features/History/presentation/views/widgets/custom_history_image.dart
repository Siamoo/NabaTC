import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomHistoryImage extends StatelessWidget {
  const CustomHistoryImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * .5;
    return Column(
      children: [
        Text(
          "No history found",
          style: GoogleFonts.bangers(
              textStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: kWhiteColor)),
        ),
        Container(
          width: screenWidth ,
          height: screenWidth ,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image:  AssetImage('asset/images/history.png'),
              fit: BoxFit.fill,
            ),
            // Optional: adds rounded corners
          ),
        ),
      ],
    );
  }
}

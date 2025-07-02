
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBarTitle extends StatelessWidget {
  const CustomAppBarTitle({
    super.key,
    required this.pageTilte,
  });

  final String pageTilte;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          pageTilte,
          style: GoogleFonts.bangers(
            textStyle: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w500,
              color: kOrangeColor,
            ),
          ),
        ),
      ],
    );
  }
}

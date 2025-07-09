import 'dart:io';

import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSelectedImage extends StatelessWidget {
  const CustomSelectedImage({
    super.key,
    required File? image,
  }) : _image = image;

  final File? _image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Image selected",
          style: GoogleFonts.bangers(
              textStyle: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: kWhiteColor)),
        ),
        Container(
          width: 300,
          height: 400,
          decoration: BoxDecoration(
            border: Border.all(
              color: kWhiteBlackColor, // Border color
              width: 3, // Border width
            ),
            borderRadius: BorderRadius.circular(20), // Rounded corners
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
                20), // Ensure image corners match the container's corners
            child: Image.file(
              _image!,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}

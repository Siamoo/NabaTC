import 'dart:io';

import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomPlantImage extends StatelessWidget {
  const CustomPlantImage({
    super.key,
    required File? image,
    required this.name,
  }) : _image = image;

  final File? _image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: (MediaQuery.of(context).size.width) * .73,
          child: Center(
            child: Text(
              name,
              style: GoogleFonts.bangers(
                  textStyle: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w500,
                      color: kWhiteColor)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Container(
          width: 300,
          height: 250,
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
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}

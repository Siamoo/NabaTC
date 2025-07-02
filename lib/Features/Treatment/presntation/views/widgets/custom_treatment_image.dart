import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTreatmentImage extends StatelessWidget {
  const CustomTreatmentImage({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width * .5;
    return Column(
      children: [
        SizedBox(
          width: (MediaQuery.of(context).size.width) * .7,
          child: Center(
            child: Text(
              name,
              style: GoogleFonts.bangers(
                textStyle: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    color: kWhiteColor),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Container(
          width: screenWidth *1.5,
          height: screenWidth *1.5,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage('asset/images/treatment.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }
}


import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomDescription extends StatelessWidget {
  const CustomDescription({
    super.key,
     required this.title, required this.decoration,
  });

  final String title;
  final String decoration;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title:',
            style: GoogleFonts.bangers(
                textStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: kOrangeColor)),
          ),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * .92,
            child: Text(
              '● $decoration',
              style: GoogleFonts.bangers(
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                  color: kWhiteColor,
                ),
              ),
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

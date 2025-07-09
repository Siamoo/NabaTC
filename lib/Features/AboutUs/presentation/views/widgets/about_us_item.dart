import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutUsItem extends StatelessWidget {
  const AboutUsItem({super.key, required this.image, required this.name, required this.track});
  final String image;
  final String name;
  final String track;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: kWhiteColor,
            radius: 30,
            child: ClipOval(
              child: Image.asset(
                image,
                fit: BoxFit.cover,
                width: 65,
                height: 65,
              ),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Text(
            name,
            style: GoogleFonts.bangers(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
                color: kWhiteColor,
              ),
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(
            width: 20,
          ),
          Text(
            track,
            style: GoogleFonts.bangers(
              textStyle: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w300,
                color: Colors.white60,
              ),
            ),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

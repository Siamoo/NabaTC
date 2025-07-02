import 'dart:io';

import 'package:firebase1/Features/Ai/presentation/manager/ai%20cubit/upload_state.dart';
import 'package:firebase1/Features/Ai/presentation/views/widgets/ai_body.dart';
import 'package:firebase1/Features/Treatment/presntation/views/treatment_page.dart';
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MoreInfoButton extends StatelessWidget {
  const MoreInfoButton({
    super.key,
    required this.state,
    required this.image,
  });

  final UploadSuccess state;
  final File? image;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => TreatmentPage(
                  diseaseName: formatDiseaseName(state.message),
                  image: image,
                ),
              ),
            );
          },
          style: TextButton.styleFrom(
            foregroundColor: kWhiteColor,
            backgroundColor: kHomeIconsBakColor,
            textStyle: GoogleFonts.bangers(
              textStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          child: const Text('more info'),
        ),
      ],
    );
  }
}

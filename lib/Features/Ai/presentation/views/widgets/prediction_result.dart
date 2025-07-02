
import 'dart:io';

import 'package:firebase1/Features/Ai/presentation/manager/ai%20cubit/upload_state.dart';
import 'package:firebase1/Features/Ai/presentation/views/widgets/ai_body.dart';
import 'package:firebase1/Features/Ai/presentation/views/widgets/more_info_button.dart';
import 'package:firebase1/Features/Treatment/presntation/views/treatment_page.dart';
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PredictionResult extends StatelessWidget {
  const PredictionResult({
    super.key,
    required this.image, required this.state,
  });

  final File? image;
  final UploadSuccess state;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '  prediction: ',
                style: GoogleFonts.bangers(
                  textStyle: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                      color: kOrangeColor),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                '${formatDiseaseName(state.message)} .',
                style: GoogleFonts.bangers(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                    color: kWhiteColor,
                  ),
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 13),
              child: Text(
                '  confidence: ',
                style: GoogleFonts.bangers(
                  textStyle: const TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w300,
                      color: kOrangeColor),
                ),
              ),
            ),
            Text(
              '${state.additionalInfo} %',
              style: GoogleFonts.bangers(
                textStyle: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w300,
                    color: kWhiteColor),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        if (state.message != 'healthy')
          MoreInfoButton(state: state, image: image),
      ],
    );
  }
}


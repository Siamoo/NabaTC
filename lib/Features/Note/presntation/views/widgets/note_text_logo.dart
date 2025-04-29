
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';

class NoteTextLogo extends StatelessWidget {
  const NoteTextLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Steps to save plants',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w800,
              color: kOrangeColor),
        ),
      ],
    );
  }
}




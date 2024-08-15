
import 'package:flutter/material.dart';

class HomeTextLogo extends StatelessWidget {
  const HomeTextLogo({
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
              color: Colors.orangeAccent),
        ),
      ],
    );
  }
}




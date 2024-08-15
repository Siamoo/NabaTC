
import 'package:flutter/material.dart';

class HomeLogo extends StatelessWidget {
  const HomeLogo({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * .15, vertical: screenWidth * .05),
      child: Container(
        width: screenWidth * .6,
        height: screenWidth * .5,
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('asset/images/home.jpg'),
            fit: BoxFit.fill,
          ),
          border: Border.all(
            color: const Color.fromARGB(
                255, 250, 250, 250), // Border color
            width: 8, // Border width
          ),
          borderRadius: BorderRadius.circular(
              40), // Optional: adds rounded corners
        ),
      ),
    );
  }
}

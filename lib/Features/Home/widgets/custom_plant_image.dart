
import 'package:flutter/material.dart';

class CustomHomePlantImage extends StatelessWidget {
  const CustomHomePlantImage({
    super.key, required this.imageName,
  });
 final String imageName;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
      child: Image.asset(
        imageName,
        fit: BoxFit.cover,
        height: MediaQuery.sizeOf(context).width * .3,
        width: MediaQuery.sizeOf(context).width * .2,
      ),
    );
  }
}

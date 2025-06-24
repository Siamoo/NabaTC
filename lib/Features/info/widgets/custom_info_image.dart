import 'package:flutter/material.dart';

class CustomInfoImage extends StatelessWidget {
   const CustomInfoImage({super.key,required this.infoImageName});
  final String infoImageName ;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        infoImageName,
        fit: BoxFit.cover,
        height: MediaQuery.sizeOf(context).width * .3,
        width: MediaQuery.sizeOf(context).width * .5,
      ),
    );
  }
}
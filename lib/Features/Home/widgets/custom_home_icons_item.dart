

import 'package:firebase1/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomHomeIconsItem extends StatelessWidget {
  const CustomHomeIconsItem({
    super.key,
    required this.pageName,
    required this.iconName,
    required this.iconText, 
    required this.iconSize,
  });

  final Widget pageName;
  final IconData iconName;
  final String iconText;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            // Navigator.pushReplacementNamed(context, pageName);
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => pageName,
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding:  EdgeInsets.symmetric(
              vertical: (34-(iconSize/1.85)),
            ),
            backgroundColor: kHomeIconsBakColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(iconName, size: iconSize, color: kHomeIconsColor),
            ],
          ),
        ),
        const SizedBox(height: 2),
        Text(iconText,
            style: const TextStyle(
                fontWeight: FontWeight.w800, color: kWhiteColor, fontSize: 16)),
      ],
    );
  }
}

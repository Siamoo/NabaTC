

import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomHomeIconsItem extends StatelessWidget {
  const CustomHomeIconsItem({
    super.key,
    required this.pageName,
    required this.iconText,
    required this.iconSize,
    this.iconName,
    this.isGif = false,
    this.gifPath,
  });

  final Widget pageName;
  final String iconText;
  final double iconSize;
  final IconData? iconName;
  final bool isGif;
  final String? gifPath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => pageName,
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(
              vertical: (30 - (iconSize / 1.85)),
              // horizontal: (60 - (iconSize / 1.85))
            ),
            backgroundColor: kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: isGif
              ? Image.asset(
                  gifPath!,
                  width: iconSize + 10,
                  height: iconSize + 10,
                  fit: BoxFit.cover,
                )
              : Icon(iconName, size: iconSize, color: kHomeIconsColor),
        ),
        // const SizedBox(height: 2),
        Text(iconText,
            style: const TextStyle(
                fontWeight: FontWeight.w800, color: kWhiteColor, fontSize: 19)),
      ],
    );
  }
}

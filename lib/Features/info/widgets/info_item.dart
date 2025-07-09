
import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:flutter/material.dart';

class InfoItem extends StatelessWidget {
  const InfoItem({
    super.key,
    required this.infoImage,
    required this.screenWidth,
    required this.infoName,
    required this.infoDescrip,
  });

  final Widget infoImage;
  final double screenWidth;
  final String infoName;
  final String infoDescrip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(26),
              color: const Color.fromARGB(100, 0, 0, 0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 8, bottom: 8, left: 10),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  infoImage,
                  const SizedBox(
                    width: 20,
                  ),
                  SizedBox(
                    width: screenWidth * 1.85,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 20, right: 16, left: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            infoName,
                            style: const TextStyle(
                              color: kYellowOrangeColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            infoDescrip,
                            style: const TextStyle(
                                fontSize: 17, color: Colors.white70),
                            // maxLines: 4,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

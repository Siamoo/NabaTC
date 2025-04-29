

import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';

class SecondSliderPage extends StatelessWidget {
  const SecondSliderPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 480,
          ),
          Text(
            'i\'m with you.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kWhiteColor,
              fontSize: 24.0,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'To know how to use tools and identify plant diseases from leaves.',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white54,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

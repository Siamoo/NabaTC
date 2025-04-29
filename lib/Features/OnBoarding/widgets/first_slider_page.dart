
import 'package:firebase1/constant.dart';
import 'package:flutter/material.dart';

class FirstSliderPage extends StatelessWidget {
  const FirstSliderPage({
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
            'Hello ...',
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
            'Do you need to take care of plants without hiring an agricultural eng?',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white60,
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

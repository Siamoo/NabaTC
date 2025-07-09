

import 'package:firebase1/Features/OnBoarding/widgets/first_slider_page.dart';
import 'package:firebase1/Features/OnBoarding/widgets/second_slider_page.dart';
import 'package:firebase1/Features/OnBoarding/widgets/third_slider_page.dart';
import 'package:firebase1/Features/login/presentation/views/login_page.dart';
import 'package:firebase1/core/utils/constant/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
        finishButtonText: 'Register',
        onFinish: () {
          Navigator.pushReplacementNamed(context, 'LoginPage');
        },
        skipIcon: const Icon(
          Icons.arrow_forward,
          color: kPrimaryColor,
        ),
        finishButtonStyle: const FinishButtonStyle(
          backgroundColor: kWhiteColor,
        ),
        finishButtonTextStyle: const TextStyle(
          color: kPrimaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
        skipTextButton: const Text(
          'Skip',
          style: TextStyle(
            fontSize: 16,
            color: kWhiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Text(
          'Login',
          style: TextStyle(
            fontSize: 16,
            color: kWhiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        trailingFunction: () {
          Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
        },
        controllerColor: kWhiteColor,
        totalPage: 3,
        headerBackgroundColor: kPrimaryColor,
        pageBackgroundColor: kPrimaryColor,
        background: [
          Image.asset(
            'asset/images/plant_b7.png',
            height: 400,
          ),
          Image.asset(
            'asset/images/plant_b2.png',
            height: 400,
          ),
          Image.asset(
            'asset/images/plant_b4.png',
            height: 400,
          ),
        ],
        speed: 1.8,
        pageBodies: const [
          FirstSliderPage(),
          SecondSliderPage(),
          ThirdSliderPage(),
        ],
      );
  }
}

import 'dart:async';
import 'package:firebase1/Features/login/presentation/manger/phone%20cubit/phone_cubit.dart';
import 'package:firebase1/Features/login/presentation/views/widgets/otp_elevated_button.dart';
import 'package:firebase1/Features/login/presentation/views/widgets/otp_pin_code_text_field.dart';
import 'package:firebase1/Features/login/presentation/views/widgets/otp_text.dart';
import 'package:firebase1/Features/login/presentation/views/widgets/otp_text_timer.dart';
import 'package:firebase1/core/helpers/show_snacke_bar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OtpPage extends StatefulWidget {

  const OtpPage({super.key, });

  @override
  OtpPageState createState() => OtpPageState();
}

class OtpPageState extends State<OtpPage> {
  TextEditingController otpController = TextEditingController();
  int counterTime = 60;
  late Timer timer;


  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (siamTimer) {
      if (mounted) {
        setState(() {
          if (counterTime > 0) {
            counterTime--;
          } else {
            siamTimer.cancel();
          }
        });
      }
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter OTP'),
        backgroundColor: const Color(0xff0f393b),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<PhoneCubit, PhoneState>(
          listener: (context, state) {
            if (state is PhoneSuccess) {
              Navigator.pushReplacementNamed(context, 'ZoomDrawerPages');
            } else if (state is PhoneFailure) {
              showSnackBarHelpers(context, state.errMessage);
            }
          },
          builder: (context, state) {
            return AbsorbPointer(
              absorbing: (state is PhoneLoading) ? true : false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OTPText(widget: widget),
                  const SizedBox(height: 20),
                  OTPTextTimer(counterTime: counterTime),
                  const SizedBox(height: 20),
                  OTPPinCodeTextField(otpController: otpController),
                  const SizedBox(height: 20),
                  OTPElevatedButton(
                    otpController: otpController,
                    isLoading: (state is PhoneLoading) ? true : false,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

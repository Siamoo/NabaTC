import 'dart:async';
import 'package:firebase1/helpers/show_snacke_bar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:firebase_auth/firebase_auth.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber; // Pass the phone number from the previous screen

  const OtpPage({super.key, required this.phoneNumber});

  @override
  OtpPageState createState() => OtpPageState();
}

class OtpPageState extends State<OtpPage> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController otpController = TextEditingController();
  int counterTime = 60;
  late Timer timer;
  String? verificationId;

  @override
  void initState() {
    super.initState();
    startTimer();
    verifyPhoneNumber();
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

  void verifyPhoneNumber() async {
    await auth.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        if (mounted) {
          showSnackBarHelpers(
            context,
            'Phone number verified and user signed in: ${auth.currentUser}',
          );
        }
      },
      verificationFailed: (FirebaseAuthException e) {
        if (mounted) {
          showSnackBarHelpers(
            context,
            'Failed to verify phone number: ${e.message}',
          );
        }
      },
      codeSent: (String verificationId, int? resendToken) {
        if (mounted) {
          setState(() {
            this.verificationId = verificationId;
          });
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        if (mounted) {
          setState(() {
            this.verificationId = verificationId;
          });
        }
      },
    );
  }

  void verifyOtp(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId!,
        smsCode: otp,
      );

      await auth.signInWithCredential(credential);
      if (mounted) {
        showSnackBarHelpers(context, 'User signed in: ${widget.phoneNumber}');
        Navigator.pushReplacementNamed(context, 'HomePage');
      }
    } catch (e) {
      if (mounted) {
        showSnackBarHelpers(context, 'Failed to verify OTP: ${e.toString()}');
      }
    }
  }

  @override
  void dispose() {
    timer.cancel(); // Cancel the timer
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Enter OTP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please enter the 6-digit OTP sent to ${widget.phoneNumber}',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              'Time remaining: $counterTime seconds',
              style: const TextStyle(fontSize: 16, color: Colors.red),
            ),
            const SizedBox(height: 20),
            PinCodeTextField(
              controller: otpController,
              appContext: context,
              length: 6,
              keyboardType: TextInputType.number,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(5),
                fieldHeight: 53,
                fieldWidth: 45,
                activeFillColor: Colors.black,
                selectedFillColor: Colors.black,
                inactiveFillColor: Colors.white10,
                activeColor: Colors.green,
                selectedColor: Colors.red,
                inactiveColor: Colors.grey,
              ),
              animationDuration: const Duration(milliseconds: 300),
              enableActiveFill: true,
              onChanged: (value) {
                Text(value);
              },
              onCompleted: (value) {
                showSnackBarHelpers(context, 'Completed: $value');
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String otp = otpController.text;
                verifyOtp(otp);
              },
              child: const Text('Verify'),
            ),
          ],
        ),
      ),
    );
  }
}

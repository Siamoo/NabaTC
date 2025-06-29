import 'package:firebase1/helpers/show_snacke_bar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPPinCodeTextField extends StatelessWidget {
  const OTPPinCodeTextField({
    super.key,
    required this.otpController,
  });

  final TextEditingController otpController;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
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
        // showSnackBarHelpers(context, 'Completed: $value');
      },
    );
  }
}

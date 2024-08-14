
import 'package:flutter/material.dart';

class OTPTextTimer extends StatelessWidget {
  const OTPTextTimer({
    super.key,
    required this.counterTime,
  });

  final int counterTime;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Time remaining: $counterTime seconds',
      style: const TextStyle(fontSize: 16, color: Colors.red),
    );
  }
}

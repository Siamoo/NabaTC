
import 'package:firebase1/Features/login/presntation/views/otp_page.dart';
import 'package:firebase1/helpers/show_snacke_bar_helpers.dart';
import 'package:flutter/material.dart';

class PhoneElevetedButton extends StatelessWidget {
  const PhoneElevetedButton({
    super.key,
    required this.formKey,
    required this.phonec,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phonec;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
      onPressed: () {
        if (formKey.currentState?.validate() ?? false) {
         showSnackBarHelpers(context, 'code sent');
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (builder) =>
                      OtpPage(phoneNumber: '+20${phonec.text}')));
        }
      },
      child: const Text(
        'Submit',
        style:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}

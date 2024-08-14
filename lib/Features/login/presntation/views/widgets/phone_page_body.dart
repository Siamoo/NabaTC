
import 'package:firebase1/Features/login/presntation/views/widgets/phone_eleveted_button.dart';
import 'package:firebase1/Features/login/presntation/views/widgets/phone_logo.dart';
import 'package:firebase1/Features/login/presntation/views/widgets/phone_text_form_field.dart';
import 'package:flutter/material.dart';

class PhonePageBody extends StatelessWidget {
  const PhonePageBody({
    super.key,
    required this.formKey,
    required this.phonec,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phonec;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PhoneLogo(screenWidth: screenWidth),
            const SizedBox(
              height: 20,
            ),
            PhoneTextFormField(phonec: phonec),
            const SizedBox(height: 10),
            PhoneElevetedButton(formKey: formKey, phonec: phonec),
          ],
        ),
      ),
    );
  }
}

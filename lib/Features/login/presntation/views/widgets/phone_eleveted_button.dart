import 'package:firebase1/Features/login/presntation/manger/phone%20cubit/phone_cubit.dart';
import 'package:firebase1/Features/login/presntation/views/otp_page.dart';
import 'package:firebase1/helpers/show_snacke_bar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocBuilder<PhoneCubit, PhoneState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              BlocProvider.of<PhoneCubit>(context).verifyPhoneNumber('+20${phonec.text}');
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (builder) =>
                          const OtpPage()));
            }
          },
          child: const Text(
            'Submit',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}

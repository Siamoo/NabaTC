import 'package:firebase1/Features/login/presntation/manger/phone%20cubit/phone_cubit.dart';
import 'package:firebase1/Features/login/presntation/views/otp_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhoneElevetedButton extends StatelessWidget {
  const PhoneElevetedButton({
    super.key,
    required this.formKey,
    required this.phonec,
    required this.isLoading,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phonec;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneCubit, PhoneState>(
      builder: (context, state) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            if (formKey.currentState?.validate() ?? false) {
              BlocProvider.of<PhoneCubit>(context)
                  .verifyPhoneNumber('+20${phonec.text}');
              Navigator.push(context,
                  MaterialPageRoute(builder: (builder) => const OtpPage()));
            }
          },
          child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : const Text(
            'OK',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }
}

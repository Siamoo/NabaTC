import 'package:firebase1/Features/login/presntation/manger/phone%20cubit/phone_cubit.dart';
import 'package:firebase1/Features/login/presntation/views/widgets/phone_eleveted_button.dart';
import 'package:firebase1/Features/login/presntation/views/widgets/phone_logo.dart';
import 'package:firebase1/Features/login/presntation/views/widgets/phone_text_form_field.dart';
import 'package:firebase1/helpers/show_snacke_bar_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: BlocConsumer<PhoneCubit, PhoneState>(
          listener: (context, state) {
            if (state is PhoneCodeSent) {
              showSnackBarHelpers(context, 'code send');
            }else if(state is PhoneVerified){
              showSnackBarHelpers(context, state.verifyMessage);
            }
          },
          builder: (context, state) {
            return Column(
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
            );
          },
        ),
      ),
    );
  }
}

import 'package:firebase1/Features/login/presentation/views/widgets/phone_page_body.dart';
import 'package:flutter/material.dart';

class PhonePage extends StatefulWidget {
  const PhonePage({super.key});

  @override
  PhonePageState createState() => PhonePageState();
}

class PhonePageState extends State<PhonePage> {
  final formKey = GlobalKey<FormState>();
  final phonec = TextEditingController();

  @override
  void dispose() {
    phonec.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PhonePageBody(formKey: formKey, phonec: phonec);
  }
}

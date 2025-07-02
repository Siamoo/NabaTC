import 'package:flutter/material.dart';

class CustomAskTextField extends StatelessWidget {
  const CustomAskTextField({
    super.key,
    required this.title,
    required this.icon,
    this.controller,
  });

  final String title;
  final Icon icon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        controller: controller,
        minLines: 1,
        maxLines: 6,
        decoration: InputDecoration(
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff00dfc0)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff00dfc0)),
          ),
          hintText: title,
          prefixIcon: icon,
          contentPadding: const EdgeInsets.symmetric(vertical: 12.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}

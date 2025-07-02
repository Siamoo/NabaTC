import 'package:flutter/material.dart';
const Duration myDuration = Duration(milliseconds: 2000);

void showSnackBarHelpers(BuildContext context, String message,
    {Duration duration = myDuration}) {
  // Hide any current SnackBar to avoid Hero tag conflict
  ScaffoldMessenger.of(context).hideCurrentSnackBar();

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: duration,
      content: Text(message),
    ),
  );
}

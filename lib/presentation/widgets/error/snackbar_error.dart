import 'package:flutter/material.dart';

void snackbarError(
  BuildContext context, {
  int duration = 3,
  String message = 'Error',
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: Duration(seconds: duration),
    ),
  );
}

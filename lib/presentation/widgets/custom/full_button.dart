import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/styles.dart';

class FullButton extends StatelessWidget {
  const FullButton(
      {Key? key,
      this.onPressed,
      this.text = 'Button',
      this.marginTop = 25,
      this.marginBottom = 15})
      : super(key: key);
  final Function()? onPressed;
  final String text;
  final double marginTop;
  final double marginBottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(top: marginTop, bottom: marginBottom),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(text,
            style: buttonLarge),
      ),
    );
  }
}

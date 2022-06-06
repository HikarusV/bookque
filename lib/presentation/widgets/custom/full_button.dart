import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FullButton extends StatelessWidget {
  const FullButton(
      {Key? key,
      this.onPressed,
      this.text = 'Button',
      this.marginTop = 25,
      this.marginBot = 15})
      : super(key: key);
  final Function()? onPressed;
  final String text;
  final double marginTop;
  final double marginBot;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      margin: EdgeInsets.only(top: marginTop, bottom: marginBot),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: const Color(0xff63B1F2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Text(text,
            style: GoogleFonts.poppins(fontSize: 18, color: Colors.white)),
      ),
    );
  }
}

import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingButton extends StatelessWidget {
  const SettingButton({
    Key? key,
    this.text = 'Button',
    this.version = false,
    this.icon = Icons.keyboard_arrow_right,
    required this.onPressed,
  }) : super(key: key);

  final String text;
  final IconData icon;
  final bool version;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: OutlinedButton(
        style: ButtonStyle(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
          side: MaterialStateProperty.all(BorderSide(
              color: Theme.of(context).colorScheme.primary,
              width: 1.3,
              style: BorderStyle.solid)),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: buttonMediumBlack.fontSize,
                    fontStyle: buttonMediumBlack.fontStyle,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                version ? Text('v1.0.0', style: subTextGrey) : Container(),
                Icon(
                  icon,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

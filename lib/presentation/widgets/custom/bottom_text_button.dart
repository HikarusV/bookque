import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomTextButton extends StatelessWidget {
  const BottomTextButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Sudah memiliki akun? ',
              style: GoogleFonts.poppins(fontSize: 16)),
          GestureDetector(
            onTap: () {
              // Navigator.pop(context);
            },
            child: Text('Daftar',
                style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff63B1F2))),
          )
        ],
      ),
    );
  }
}

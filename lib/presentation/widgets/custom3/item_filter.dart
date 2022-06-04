import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemFilter extends StatelessWidget {
  const ItemFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: const Color(0xff63B1F2),
        borderRadius: BorderRadius.circular(12),
      ),
      height: 30,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Filter by : ',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          Text(
            'Last Modification ',
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
          const Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffE7F2FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            child: Icon(Icons.search, color: Colors.blue.shade600),
          ),
          TextField(
            style: GoogleFonts.poppins(),
            decoration: InputDecoration(
              hintText: 'Cari buku yang kamu inginkan..',
              hintStyle: GoogleFonts.poppins(color: Colors.grey),
              contentPadding: const EdgeInsets.only(
                  top: 11, bottom: 9, left: 35, right: 15),
              isDense: true,
              border: InputBorder.none,
            ),
          ),
        ],
      ),
    );
  }
}

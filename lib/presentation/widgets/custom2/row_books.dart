import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/models/poster.dart';

class RowBooks extends StatelessWidget {
  const RowBooks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      height: 208,
      child: ListView(
          scrollDirection: Axis.horizontal,
          children: listPoster.map((poster) {
            return Container(
              margin: const EdgeInsets.only(right: 10),
              child: GestureDetector(
                onTap: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => const DetailPage(),
                  //   ),
                  // );
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        poster.image,
                        width: 124,
                        height: 170,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      'Judul Buku',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'Penulis',
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff8C9198),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList()),
    );
  }
}

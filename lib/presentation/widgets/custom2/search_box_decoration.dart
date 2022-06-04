import 'package:bookque/presentation/pages/search/search_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBoxDecoration extends StatelessWidget {
  const SearchBoxDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const SearchPage(),
          ),
        );
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        alignment: Alignment.centerLeft,
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
            Padding(
              padding: const EdgeInsets.only(
                  top: 11, bottom: 9, left: 35, right: 15),
              child: Text(
                'Cari buku yang kamu inginkan..',
                style: GoogleFonts.poppins(
                    color: Colors.grey, fontWeight: FontWeight.w300),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

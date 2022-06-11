import 'package:bookque/presentation/pages/search/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/styles.dart';

class SearchBoxDecoration extends StatelessWidget {
  const SearchBoxDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const Search(),
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
          color: secondaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              bottom: 0,
              child: Icon(Icons.search, color: primaryColor),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 11, bottom: 9, left: 35, right: 15),
              child: Text(
                'Cari buku yang kamu inginkan..',
                style: subTextGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

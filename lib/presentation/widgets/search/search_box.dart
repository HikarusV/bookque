import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/localizations.dart';
import '../../../common/styles.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key, this.onEventSubmited}) : super(key: key);
  final Function(String text)? onEventSubmited;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
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
          TextField(
            style: GoogleFonts.poppins(),
            onSubmitted: onEventSubmited,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context)!.searchPlaceholderText,
              hintStyle: hintTitle,
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

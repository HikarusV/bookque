import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/custom2/double_list_books.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/scroll_behavior_without_glow.dart';
import '../../widgets/search/filter_search.dart';
import '../../widgets/search/search_box.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Search',
      child: Container(
        margin: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Expanded(
                  flex: 10,
                  child: SearchBox(),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: FilterSearch(),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Hasil Pencarian',
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.w500),
            ),
            ScrollConfiguration(
              behavior: ScrollBehaviorWithoutGlow(),
              child: const Expanded(
                child: DoubleListBooks(
                  isScroolable: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

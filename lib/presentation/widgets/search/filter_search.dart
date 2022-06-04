import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/search/filter_jenis.dart';
import '../../widgets/search/filter_pencarian.dart';
import '../../widgets/search/filter_urutkan.dart';

class FilterSearch extends StatelessWidget {
  const FilterSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(24),
            ),
          ),
          builder: (context) => Container(
            margin:
            const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 150,
                      height: 3,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Filter',
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const FilterPencarian(),
                const FilterUrutkan(),
                const FilterJenis(),
              ],
            ),
          ),
        );
      },
      child: Image.asset(
        'assets/filter_search.png',
        width: 30,
        height: 30,
      ),
    );
  }
}

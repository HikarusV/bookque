import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../data/models/categories.dart';
import '../../widgets/custom_scaffold.dart';

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem(
      {Key? key, required this.items, required this.onTapItems})
      : super(key: key);
  final List<Categories> items;
  final Function()? onTapItems;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Kategori',
      child: Container(
        margin: const EdgeInsets.only(
          left: 15,
          right: 15,
        ),
        child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final Categories item = items[index];
            return InkWell(
              onTap: onTapItems,
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Image.asset(
                      item.imageAsset,
                      width: 60,
                      height: 60,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      item.name,
                      style: GoogleFonts.poppins(fontSize: 24),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

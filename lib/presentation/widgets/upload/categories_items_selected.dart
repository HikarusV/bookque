import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'list_categories_selected.dart';

class CategoriesItemsSelected extends StatefulWidget {
  const CategoriesItemsSelected(
      {Key? key, required this.title, required this.count})
      : super(key: key);

  final String title;
  final CategoriesSelectCount count;

  @override
  State<CategoriesItemsSelected> createState() =>
      _CategoriesItemsSelectedState();
}

class _CategoriesItemsSelectedState extends State<CategoriesItemsSelected> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        if (!isSelected) {
          if (widget.count.canAdd()) {
            widget.count.addSelectedItem();
            isSelected = !isSelected;
          }
        } else {
          widget.count.lessSelectedItem();
          isSelected = !isSelected;
        }
      }),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.blue.shade200,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            isSelected
                ? Icon(
              Icons.check_circle,
              color: Colors.blue.shade500,
            )
                : Icon(
              Icons.circle_outlined,
              color: Colors.blue.shade200,
            ),
          ],
        ),
      ),
    );
  }

  void changeItems() {
    setState(() {
      isSelected = !isSelected;
    });
  }
}

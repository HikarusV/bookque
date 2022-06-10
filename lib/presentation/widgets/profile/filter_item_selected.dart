import 'package:flutter/material.dart';

import '../../../common/styles.dart';
import 'list_filter_selected.dart';

class FilterItemsSelected extends StatefulWidget {
  const FilterItemsSelected(
      {Key? key, required this.title, required this.count})
      : super(key: key);

  final String title;
  final FilterSelectCount count;

  @override
  State<FilterItemsSelected> createState() => _FilterItemsSelectedState();
}

class _FilterItemsSelectedState extends State<FilterItemsSelected> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        Navigator.pop(context);
        if (!isSelected) {
          widget.count.addSelectedItem();
          isSelected = !isSelected;
        }
      }),
      child: Container(
        margin: const EdgeInsets.fromLTRB(10, 15, 10, 15),
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: Theme.of(context).dividerColor))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: titleSmall,
            ),
            isSelected
                ? const Icon(
                    Icons.circle,
                    color: primaryColor,
                  )
                : const Icon(
                    Icons.circle_outlined,
                    color: primaryColor,
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

import 'package:bookque/presentation/provider/profile_items_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/styles.dart';
import 'list_filter_selected.dart';

class FilterItemsSelected extends StatelessWidget {
  const FilterItemsSelected(
      {Key? key,
      required this.title,
      required this.count,
      this.isSelected = false,
      required this.id})
      : super(key: key);
  final bool isSelected;
  final String title;
  final FilterSelectCount count;
  final int id;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<ProfileItemsProvider>().changeSort(id);
        Navigator.pop(context);
      },
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
              title,
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
}

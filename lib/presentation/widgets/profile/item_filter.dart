import 'package:bookque/data/models/filter.dart';
import 'package:flutter/material.dart';

import '../../../common/localizations.dart';
import '../../../common/styles.dart';
import 'list_filter_selected.dart';

class ItemFilter extends StatelessWidget {
  ItemFilter({Key? key}) : super(key: key);
  final FilterSelectCount count = FilterSelectCount();

  @override
  Widget build(BuildContext context) {
    final data = getListFilter(context);
    bool isSelected = false;

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
                      margin: const EdgeInsets.only(bottom: 25),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      width: 150,
                      height: 3,
                    ),
                  ],
                ),
                Text(
                  AppLocalizations.of(context)!.sortTitleText,
                  style: titleMedium,
                ),
                const SizedBox(
                  height: 15,
                ),
                ListFilterSelected(
                  items: data,
                  count: count,
                )
              ],
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(12),
        ),
        height: 30,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.sortButtonText,
              style: filterTitle,
            ),
            Text(
              AppLocalizations.of(context)!.sortUploadItem1,
              style: filterTitle,
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

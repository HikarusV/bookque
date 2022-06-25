import 'package:bookque/presentation/provider/upload_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/styles.dart';
import 'list_categories_selected.dart';

class CategoriesItemsSelected extends StatefulWidget {
  const CategoriesItemsSelected(
      {Key? key,
      required this.title,
      required this.id,
      required this.count,
      this.cacheSelected = false})
      : super(key: key);

  final String title;
  final String id;
  final CategoriesSelectCount count;
  final bool cacheSelected;

  @override
  State<CategoriesItemsSelected> createState() =>
      _CategoriesItemsSelectedState();
}

class _CategoriesItemsSelectedState extends State<CategoriesItemsSelected> {
  @override
  void initState() {
    super.initState();
    isSelected = widget.cacheSelected;
  }

  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        if (!isSelected) {
          if (widget.count.canAdd()) {
            widget.count.addSelectedItem(widget.title, widget.id);
            isSelected = !isSelected;
          }
        } else {
          widget.count.lessSelectedItem(
              ListCategoriesItemsSelect(widget.id, widget.title));
          isSelected = !isSelected;
        }
        context.read<UploadUpdateItemProvider>().updateCache();
      }),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(
            color: primaryColor,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.title,
              style: titleSmall,
            ),
            isSelected
                ? const Icon(
                    Icons.check_circle,
                    color: primaryColor,
                  )
                : const Icon(Icons.circle_outlined, color: primaryColor),
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

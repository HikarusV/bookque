import 'package:bookque/common/styles.dart';
import 'package:bookque/presentation/pages/category/all_categories_list.dart';
import 'package:flutter/material.dart';

import '../../../common/localizations.dart';
import '../../../data/models/categories.dart';
import '../../widgets/custom_scaffold.dart';

class CategoriesListItem extends StatelessWidget {
  const CategoriesListItem({Key? key, required this.items, this.onTapItems})
      : super(key: key);
  final List<Categories> items;
  final Function(String categories)? onTapItems;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppLocalizations.of(context)!.categoryText,
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final Categories item = items[index];
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllCategoriesItems(
                  text: item.name,
                  id: item.id,
                ),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              margin: const EdgeInsets.symmetric(vertical: 7),
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
                    style: titleSmall,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../../../common/localizations.dart';
import '../../../common/styles.dart';
import '../../../data/models/categories.dart';
import '../../pages/category/categories_list_item.dart';

class HeadingHome extends StatelessWidget {
  const HeadingHome(
      {Key? key, this.title = 'Title', this.moreButton = false, this.onMoreTap})
      : super(key: key);
  final String title;
  final bool moreButton;
  final Function()? onMoreTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: titleMedium,
            ),
            moreButton
                ? TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoriesListItem(
                            items: listCategory,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context)!.seeAllText,
                      style: titleButtonVerySmall,
                    ),
                  )
                : Container(),
          ],
        ),
      ],
    );
  }
}

import 'package:bookque/data/models/categories.dart';
import 'package:bookque/presentation/pages/category/all_categories_list.dart';
import 'package:flutter/material.dart';

import '../../../common/styles.dart';

class CategoriesItem extends StatelessWidget {
  const CategoriesItem({Key? key, this.onItemTap, required this.items})
      : super(key: key);
  final Function()? onItemTap;
  final List<Categories> items;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      height: 75,
      child: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AllCategoriesItems(
                  text: items[index].name,
                  id: items[index].id,
                ),
              ),
            ),
            child: Column(
              children: [
                Image.asset(
                  items[index].imageAsset,
                  width: 60,
                  height: 60,
                ),
                Text(
                  items[index].name,
                  style: subTextSmall,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

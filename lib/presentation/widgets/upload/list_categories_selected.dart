import 'package:flutter/material.dart';

import '../../../data/models/categories.dart';
import 'categories_items_selected.dart';

class ListCategoriesSelected extends StatelessWidget {
  const ListCategoriesSelected({Key? key, required this.items, required this.count})
      : super(key: key);
  final List<Categories> items;
  final CategoriesSelectCount count;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => CategoriesItemsSelected(
        title: items[index].name,
        count: count,
      ),
    );
  }
}

class CategoriesSelectCount {
  CategoriesSelectCount({this.maxItems = 5, this.selectedCat = 0});

  late int maxItems;
  int selectedCat = 0;

  bool canAdd() {
    if (selectedCat < maxItems) {
      return true;
    }
    return false;
  }

  void addSelectedItem() {
    selectedCat++;
  }

  void lessSelectedItem() {
    selectedCat--;
  }
}

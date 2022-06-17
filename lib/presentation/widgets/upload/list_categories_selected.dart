import 'package:flutter/material.dart';

import '../../../data/models/categories.dart';
import 'categories_items_selected.dart';

class ListCategoriesSelected extends StatelessWidget {
  const ListCategoriesSelected(
      {Key? key, required this.items, required this.count})
      : super(key: key);
  final List<Categories> items;
  final CategoriesSelectCount count;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) => CategoriesItemsSelected(
        title: items[index].name,
        id: items[index].id,
        count: count,
        cacheSelected: count.items.contains(items[index].name),
      ),
    );
  }
}

class CategoriesSelectCount {
  CategoriesSelectCount(
      {this.maxItems = 5, this.selectedCat = 0, required this.items});
  List<String> items;
  late int maxItems;
  int selectedCat = 0;

  bool canAdd() {
    if (selectedCat < maxItems) {
      return true;
    }
    return false;
  }

  void addSelectedItem(String item) {
    Set<String> buffer = items.toSet();
    buffer.add(item);
    items = buffer.toList();
    selectedCat++;
  }

  void lessSelectedItem(String item) {
    if (items.contains(item)) {
      Set<String> buffer = items.toSet();
      buffer.remove(item);
      items = buffer.toList();
    }
    selectedCat--;
  }
}

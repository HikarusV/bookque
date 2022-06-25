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
        cacheSelected: count.containId(items[index].id) != -1,
      ),
    );
  }
}

class CategoriesSelectCount {
  CategoriesSelectCount(
      {this.maxItems = 5, this.selectedCat = 0, required this.items});
  List<ListCategoriesItemsSelect> items;
  late int maxItems;
  int selectedCat = 0;

  bool canAdd() {
    if (selectedCat < maxItems) {
      return true;
    }
    return false;
  }

  int containId(String idItemsTarget) {
    int index = 0;
    for (ListCategoriesItemsSelect i in items) {
      if (i.id == idItemsTarget) {
        return index;
      }
      index++;
    }
    return -1;
  }

  void addSelectedItem(String itemName, String itemId) {
    items.add(ListCategoriesItemsSelect(itemId, itemName));
    selectedCat++;
  }

  void lessSelectedItem(ListCategoriesItemsSelect item) {
    int index = containId(item.id);
    if (index != -1) {
      items.removeAt(index);
    }
    selectedCat--;
  }

  String getText() {
    List resultText = [];
    for (var i in items) {
      resultText.add(i.name);
    }
    String result = resultText.toString();
    return result.substring(1, result.length - 1);
  }

  String getIdText() {
    List resultText = [];
    for (var i in items) {
      resultText.add(i.id);
    }
    String result = resultText.toString();
    return result.substring(1, result.length - 1);
  }
}

class ListCategoriesItemsSelect {
  String id;
  String name;

  ListCategoriesItemsSelect(this.id, this.name);
}

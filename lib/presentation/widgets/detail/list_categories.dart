import 'package:bookque/data/models/categories.dart';

import 'detail_categories_item.dart';

class ListCategories {
  static List<DetailCategoriesItem> generateListCategories(List categories) {
    List<DetailCategoriesItem> buffer = [];
    for (int i = 1; i < categories.length; i++) {
      int index = listCategoriesId.indexOf(categories[i]);
      String text = (index == -1)
          ? categories[i].split('_')[0]
          : listCategory[index].name;
      buffer.add(
        DetailCategoriesItem(
          text: text,
        ),
      );
    }
    return buffer;
  }
}

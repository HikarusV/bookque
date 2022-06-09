import 'package:bookque/presentation/widgets/scroll_behavior_without_glow.dart';
import 'package:flutter/material.dart';

import '../../../data/models/categories.dart';
import '../../widgets/custom/full_button.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/upload/list_categories_selected.dart';

class SelectCategory extends StatelessWidget {
  SelectCategory({Key? key}) : super(key: key);

  final CategoriesSelectCount count = CategoriesSelectCount();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Pilih Kategori',
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ScrollConfiguration(
          behavior: ScrollBehaviorWithoutGlow(),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: ListCategoriesSelected(
                  items: listCategory,
                  count: count,
                ),
              ),
              Flexible(
                flex: 0,
                child: FullButton(
                  onPressed: () => '',
                  text: 'Simpan',
                  marginTop: 15,
                  marginBottom: 15,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

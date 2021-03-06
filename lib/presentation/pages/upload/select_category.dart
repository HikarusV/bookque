import 'package:bookque/presentation/provider/upload_provider.dart';
import 'package:bookque/presentation/widgets/scroll_behavior_without_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/localizations.dart';
import '../../../data/models/categories.dart';
import '../../widgets/auth/full_button.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/upload/list_categories_selected.dart';

class SelectCategory extends StatelessWidget {
  const SelectCategory({Key? key, this.onFinish, required this.count})
      : super(key: key);
  final Function()? onFinish;

  final CategoriesSelectCount count;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppLocalizations.of(context)!.categoryUploadPlaceholderText,
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
                child: Column(
                  children: [
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                        'categories : ${context.watch<UploadUpdateItemProvider>().itemCat.items.length}/5'),
                    FullButton(
                      onPressed: onFinish,
                      text: AppLocalizations.of(context)!.saveText,
                      marginTop: 15,
                      marginBottom: 15,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

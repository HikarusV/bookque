import 'package:bookque/presentation/provider/categories_provider.dart';
import 'package:bookque/presentation/widgets/custom2/double_list_books.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/state_enum.dart';

class AllCategoriesItems extends StatefulWidget {
  const AllCategoriesItems({Key? key, this.text = 'Categories'})
      : super(key: key);
  final String text;

  @override
  State<AllCategoriesItems> createState() => _AllCategoriesItemsState();
}

class _AllCategoriesItemsState extends State<AllCategoriesItems> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<CategoriesProvider>(context, listen: false)
          ..fetchCategoriesItem(widget.text));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: widget.text,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Consumer<CategoriesProvider>(builder: (context, value, _) {
            if (value.stateCategories == ResultState.loading) {
              return const Text('Loading');
            } else if (value.stateCategories == ResultState.hasData) {
              return DoubleListBooks(
                isScroolable: true,
                listData: value.dataCategories[widget.text] ?? [],
                isNetwork: true,
              );
            } else if (value.stateCategories == ResultState.error) {
              return Text(value.categoriesMessage);
            }
            return const Text('Diluar if');
          })),
    );
  }
}

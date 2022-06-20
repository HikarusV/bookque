import 'package:bookque/presentation/provider/categories_provider.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/state_enum.dart';
import '../../widgets/home/double_list_books.dart';

class AllCategoriesItems extends StatefulWidget {
  const AllCategoriesItems({Key? key, this.text = 'Categories', this.id = 'id'})
      : super(key: key);
  final String text;
  final String id;

  @override
  State<AllCategoriesItems> createState() => _AllCategoriesItemsState();
}

class _AllCategoriesItemsState extends State<AllCategoriesItems> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<CategoriesProvider>(context, listen: false)
          ..fetchCategoriesItem(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: widget.text,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Consumer<CategoriesProvider>(builder: (context, value, _) {
            if (value.stateCategories == ResultState.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (value.stateCategories == ResultState.hasData) {
              return DoubleListBooks(
                isScroolable: true,
                listData: value.dataCategories[widget.id] ?? [],
                isNetwork: true,
              );
            } else if (value.stateCategories == ResultState.error) {
              return Text(value.categoriesMessage);
            }
            return const Text('');
          })),
    );
  }
}

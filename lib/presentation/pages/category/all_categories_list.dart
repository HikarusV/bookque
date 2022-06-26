import 'package:bookque/presentation/provider/categories_provider.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/localizations.dart';
import '../../../common/state_enum.dart';
import '../../provider/internet_provider.dart';
import '../../widgets/home/double_list_books.dart';
import '../../widgets/search/search_image_result.dart';

class AllCategoriesItems extends StatefulWidget {
  static const String routeName = 'CategoriesPage';

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
                tagPrefix: 'cat-',
                isScroolable: true,
                listData: value.dataCategories[widget.id] ?? [],
                isNetwork: true,
              );
            } else if (value.stateCategories == ResultState.error) {
              return ImageResult(
                text: AppLocalizations.of(context)!.problemWithInternet,
                pathImage: 'assets/problem.png',
                withRefresh: true,
                onPressed: () => value.fetchCategoriesItem(widget.id),
              );
            }
            return const Text('');
          })),
    );
  }
}

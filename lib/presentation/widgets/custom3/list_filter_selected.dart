import 'package:bookque/data/models/filter.dart';
import 'package:bookque/presentation/widgets/custom3/filter_item_selected.dart';
import 'package:flutter/material.dart';

class ListFilterSelected extends StatelessWidget {
  const ListFilterSelected({Key? key, required this.items, required this.count})
      : super(key: key);
  final List<Filters> items;
  final FilterSelectCount count;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: items.length,
      itemBuilder: (context, index) => FilterItemsSelected(
        title: items[index].name,
        count: count,
      ),
    );
  }
}

class FilterSelectCount {
  FilterSelectCount({this.selectedFilter = 0});

  int selectedFilter = 0;

  void addSelectedItem() {
    selectedFilter++;
  }
}

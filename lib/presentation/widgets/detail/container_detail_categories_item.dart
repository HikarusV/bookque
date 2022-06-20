import 'package:bookque/presentation/widgets/detail/detail_categories_item.dart';
import 'package:flutter/material.dart';

class ContainerDetailCategoriesItem extends StatelessWidget {
  const ContainerDetailCategoriesItem(
      {Key? key, required this.items, required this.type})
      : super(key: key);
  final List<DetailCategoriesItem> items;
  final DetailCategoriesItem type;

  @override
  Widget build(BuildContext context) {
    List<Widget> items1 = [type];
    List<Widget> items2 = [];

    for (var i in items) {
      if (items1.length < 3) {
        items1.add(i);
      } else {
        items2.add(i);
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 20, top: 3),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items1,
          ),
          (items2.isNotEmpty)
              ? const SizedBox(
                  height: 6,
                )
              : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: items2,
          ),
        ],
      ),
    );
  }
}

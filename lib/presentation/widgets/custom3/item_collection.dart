import 'package:flutter/material.dart';

import '../scroll_behavior_without_glow.dart';

class ItemCollection extends StatelessWidget {
  const ItemCollection(
      {Key? key, required this.items, required this.onItemTap})
      : super(key: key);
  final List items;
  final Function()? onItemTap;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehaviorWithoutGlow(),
      child: Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 0.65,
            crossAxisSpacing: 15,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final book = items[index];

            return Column(
              children: [
                GestureDetector(
                  onTap: onItemTap,
                  child: Column(
                    children: [
                      Image.asset(
                        book.imageAsset,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

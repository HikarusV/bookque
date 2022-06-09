import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/styles.dart';

class CategoriesItem extends StatelessWidget {
  CategoriesItem({Key? key, this.onItemTap}) : super(key: key);
  final Function()? onItemTap;
  List<Widget> items = [];
  int i = 0;

  @override
  Widget build(BuildContext context) {
    while (i++ < 9) {
      items.add(
        Column(
          children: [
            Image.asset(
              'assets/list_category$i.png',
              width: 60,
              height: 60,
            ),
            Text(
              'Investasi',
              style: subTextSmall,
            ),
          ],
        ),
      );
    }

    return Container(
      margin: const EdgeInsets.only(top: 5),
      height: 75,
      child: ListView.builder(
        itemCount: items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return items[index];
        },
      ),
    );
  }
}

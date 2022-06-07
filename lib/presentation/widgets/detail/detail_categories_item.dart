import 'package:flutter/material.dart';

import '../../../common/styles.dart';

class DetailCategoriesItem extends StatelessWidget {
  const DetailCategoriesItem({Key? key, this.text = 'Categories'})
      : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: Text(
            text,
            style: subText,
          ),
        ),
      ),
    );
  }
}

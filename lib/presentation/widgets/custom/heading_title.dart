import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';

class HeadingTitle extends StatelessWidget {
  const HeadingTitle({Key? key,
    this.title = 'Title',
    this.subTitle = 'Subtitle'})
      : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: titleLarge,
          ),
          const SizedBox(height: 5),
          Text(
            subTitle,
            style: titleSmall,
          ),
        ],
      ),
    );
  }
}

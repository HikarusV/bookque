import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../common/styles.dart';

class HeadingHome extends StatelessWidget {
  const HeadingHome({Key? key, this.title = 'Title', this.moreButton = false, this.onMoreTap})
      : super(key: key);
  final String title;
  final bool moreButton;
  final Function()? onMoreTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: titleMedium,
            ),
            moreButton
                ? TextButton(
              onPressed: () {},
              child: Text(
                'Lihat Semua',
                style: titleButtonSmall,
              ),
            )
                : Container(),
          ],
        ),
      ],
    );
  }
}

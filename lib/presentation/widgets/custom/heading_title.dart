import 'package:flutter/material.dart';

import '../../../common/styles.dart';

class HeadingTitle extends StatelessWidget {
  const HeadingTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.blueGrey,
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Masuk',
            style: titleLarge,
          ),
          const SizedBox(height: 5),
          Text(
            'Masuk untuk melanjutkan',
            style: titleSmall,
          ),
        ],
      ),
    );
  }
}

import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';

import '../../../common/localizations.dart';

class NoBookmarkData extends StatelessWidget {
  const NoBookmarkData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.bookmark,
                  size: 120,
                  color: Colors.blue[400],
                ),
                const SizedBox(
                  height: 23,
                ),
                Text(
                  AppLocalizations.of(context)!.bookmarkTitleText,
                  style: titleSmall,
                ),
                const SizedBox(
                  height: 12,
                ),
                Text(
                  AppLocalizations.of(context)!.bookmarkText,
                  style: subText,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

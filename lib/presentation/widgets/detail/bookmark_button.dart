import 'package:flutter/material.dart';

import '../../../common/styles.dart';

class BookmarkButton extends StatefulWidget {
  const BookmarkButton({Key? key}) : super(key: key);

  @override
  _BookmarkButtonState createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
  bool isBookmark = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Icon(
        isBookmark ? Icons.bookmark : Icons.bookmark_border,
        color: primaryColor,
        size: 35,
      ),
      onTap: () {
        setState(() {
          isBookmark = !isBookmark;
        });
      },
    );
  }
}

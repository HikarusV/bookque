import 'package:flutter/material.dart';

import '../../../common/styles.dart';
import '../../widgets/custom2/double_list_books.dart';

class Bookmark extends StatelessWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Bookmark',
          style: appBarTitle,
        ),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: DoubleListBooks(
          isScroolable: true,
        ),
      ),
    );
  }
}

import 'package:bookque/data/items.dart';
import 'package:bookque/presentation/widgets/home/double_list_books.dart';
import 'package:flutter/material.dart';

class BookmarkData extends StatelessWidget {
  final List<Items> listData;
  const BookmarkData({Key? key, required this.listData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: DoubleListBooks(
        tagPrefix: 'bookmark-',
        isScroolable: true,
        isNetwork: true,
        listData: listData,
      ),
    );
  }
}

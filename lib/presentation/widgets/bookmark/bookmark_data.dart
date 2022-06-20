import 'package:bookque/data/items.dart';
import 'package:bookque/presentation/provider/database_provider.dart';
import 'package:bookque/presentation/widgets/home/double_list_books.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkData extends StatelessWidget {
  final Items items;
  const BookmarkData({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(builder: (context, provider, child) {
      return FutureBuilder<bool>(
          future: provider.isBookmarked(items.itemid),
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: DoubleListBooks(
                isScroolable: true,
                isNetwork: true,
                listData: provider.bookmarks,
              ),
            );
          });
    });
  }
}

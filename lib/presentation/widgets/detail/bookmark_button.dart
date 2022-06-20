import 'package:bookque/common/styles.dart';
import 'package:bookque/data/items.dart';
import 'package:bookque/presentation/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookmarkButton extends StatelessWidget {
  final Items items;

  const BookmarkButton({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DatabaseProvider>(
      builder: (context, provider, child) {
        return FutureBuilder<bool>(
          future: provider.isBookmarked(items.itemid),
          builder: (context, snapshot) {
            var isBookmarked = snapshot.data ?? false;
            return isBookmarked
                ? IconButton(
                    onPressed: () => provider.removeBookmark(items.itemid),
                    icon: const Icon(
                      Icons.bookmark,
                      size: 35,
                      color: primaryColor,
                    ),
                  )
                : IconButton(
                    onPressed: () => provider.addBookmark(
                      Items(
                        itemid: items.itemid,
                        title: items.title,
                        imageid: items.imageid,
                        author: items.author,
                        shortdesc: items.shortdesc,
                      ),
                    ),
                    icon: const Icon(
                      Icons.bookmark_border,
                      size: 35,
                      color: primaryColor,
                    ),
                  );
          },
        );
      },
    );
  }
}

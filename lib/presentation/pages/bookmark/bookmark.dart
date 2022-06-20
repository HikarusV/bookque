import 'package:bookque/presentation/provider/database_provider.dart';
import 'package:bookque/presentation/widgets/bookmark/bookmark_data.dart';
import 'package:bookque/presentation/widgets/bookmark/no_bookmark_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/state_enum.dart';
import '../../../common/styles.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({Key? key}) : super(key: key);

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<DatabaseProvider>(context, listen: false)..getBookmarks());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'Bookmark',
          style: appBarTitle,
        ),
        centerTitle: true,
      ),
      body: Consumer<DatabaseProvider>(
        builder: (context, provider, child) {
          if (provider.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.state == ResultState.error) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Failed to Load Data ",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          } else if (provider.state == ResultState.noData) {
            return const Center(
              child: NoBookmarkData(),
            );
          } else if (provider.state == ResultState.hasData) {
            return SingleChildScrollView(
              child: BookmarkData(listData: provider.bookmarks),
            );
          } else {
            return const Text("");
          }
        },
      ),
    );
  }
}

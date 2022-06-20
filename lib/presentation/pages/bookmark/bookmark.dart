import 'package:bookque/presentation/provider/database_provider.dart';
import 'package:bookque/presentation/widgets/bookmark/bookmark_data.dart';
import 'package:bookque/presentation/widgets/bookmark/no_bookmark_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/state_enum.dart';
import '../../../common/styles.dart';

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
            return ListView.builder(
              itemCount: provider.bookmarks.length,
              itemBuilder: (context, index) {
                return BookmarkData(items: provider.bookmarks[index]);
              },
            );
          } else {
            return const Text("");
          }
        },
      ),
    );
  }
}

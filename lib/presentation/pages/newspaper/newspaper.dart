import 'package:flutter/material.dart';

import '../../../common/styles.dart';

class NewsPaper extends StatefulWidget {
  const NewsPaper({Key? key}) : super(key: key);

  @override
  State<NewsPaper> createState() => _NewsPaperState();
}

class _NewsPaperState extends State<NewsPaper> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceVariant,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Text(
          'NewsPaper',
          style: appBarTitle,
        ),
        centerTitle: true,
      ),
      // body: Consumer<DatabaseProvider>(
      //   builder: (context, provider, child) {
      //     if (provider.state == ResultState.loading) {
      //       return const Center(child: CircularProgressIndicator());
      //     } else if (provider.state == ResultState.error) {
      //       return Center(
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: const [
      //             Text(
      //               "Failed to Load Data ",
      //               textAlign: TextAlign.center,
      //               style: TextStyle(fontSize: 16),
      //             ),
      //           ],
      //         ),
      //       );
      //     } else if (provider.state == ResultState.noData) {
      //       return const Center(
      //         child: NoBookmarkData(),
      //       );
      //     } else if (provider.state == ResultState.hasData) {
      //       return SingleChildScrollView(
      //         child: BookmarkData(listData: provider.bookmarks),
      //       );
      //     } else {
      //       return const Text("");
      //     }
      //   },
      // ),
    );
  }
}

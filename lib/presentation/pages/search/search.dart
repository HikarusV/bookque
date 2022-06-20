import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/localizations.dart';
import '../../../common/state_enum.dart';
import '../../provider/search_provider.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/home/double_list_books.dart';
import '../../widgets/scroll_behavior_without_glow.dart';
import '../../widgets/search/search_box.dart';
import '../../widgets/search/search_filter.dart';

class Search extends StatelessWidget {
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Search',
      child: Container(
        margin: const EdgeInsets.only(
          top: 15,
          left: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 0,
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 10,
                        child: Consumer<SearchProvider>(
                          builder: (context, value, _) {
                            return SearchBox(
                              onEventSubmited: (text) {
                                value.searchKeyword(text);
                              },
                            );
                          },
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                        flex: 1,
                        child: SearchFilter(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ScrollConfiguration(
                behavior: ScrollBehaviorWithoutGlow(),
                child: Consumer<SearchProvider>(
                  builder: (context, value, _) {
                    print('state : ${value.stateSearch}');
                    if (value.stateSearch == ResultState.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (value.stateSearch == ResultState.hasData) {
                      return DoubleListBooks(
                        isScroolable: true,
                        listData: value.dataSearch,
                      );
                    } else if (value.stateSearch == ResultState.error) {
                      print('diluar if');
                      return Text(value.searchMessage);
                    }
                    return Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Center(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.asset(
                                'assets/search_image1.png',
                                width: 150,
                                height: 150,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Text(
                                AppLocalizations.of(context)!.searchContentText,
                                textAlign: TextAlign.center,
                                style: titleSemiMedium,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:bookque/presentation/widgets/search/search_image_nodata.dart';
import 'package:bookque/presentation/widgets/search/search_image_result.dart';
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
  static const String routeName = 'SearchPage';
  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String textSearch = '';

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
                                textSearch = text;
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
                    if (value.stateSearch == ResultState.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (value.stateSearch == ResultState.hasData) {
                      if (value.dataSearch.isEmpty) {
                        return ImageNoDataResult(
                          text: AppLocalizations.of(context)!.noDataSearchText,
                        );
                      }

                      return DoubleListBooks(
                        tagPrefix: 'search-',
                        isScroolable: true,
                        listData: value.dataSearch,
                      );
                    } else if (value.stateSearch == ResultState.error) {
                      return ImageResult(
                        text: AppLocalizations.of(context)!.problemWithInternet,
                        pathImage: 'assets/problem.png',
                        withRefresh: true,
                        onPressed: () => value.searchKeyword(textSearch),
                      );
                    }
                    return ImageResult(
                      text: AppLocalizations.of(context)!.searchContentText,
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

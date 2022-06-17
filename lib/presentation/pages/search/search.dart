import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../common/localizations.dart';
import '../../../common/state_enum.dart';
import '../../../data/models/poster.dart';
import '../../provider/search_provider.dart';
import '../../widgets/custom2/double_list_books.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/scroll_behavior_without_glow.dart';
import '../../widgets/search/filter_search.dart';
import '../../widgets/search/search_box.dart';

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
                        child: FilterSearch(),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    AppLocalizations.of(context)!.searchResultText,
                    style: GoogleFonts.poppins(
                        fontSize: 20, fontWeight: FontWeight.w500),
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
                    return const Text('No Data');
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

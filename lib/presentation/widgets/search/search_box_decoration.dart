import 'package:bookque/presentation/pages/search/search.dart';
import 'package:bookque/presentation/provider/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/localizations.dart';
import '../../../common/styles.dart';

class SearchBoxDecoration extends StatelessWidget {
  const SearchBoxDecoration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<SearchProvider>().resetSearchResult();
        Navigator.of(context).pushNamed(Search.routeName);
      },
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.inverseSurface,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          children: [
            const Positioned(
              top: 0,
              bottom: 0,
              child: Icon(Icons.search, color: primaryColor),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 11, bottom: 9, left: 35, right: 15),
              child: Text(
                AppLocalizations.of(context)!.searchPlaceholderText,
                style: subTextGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

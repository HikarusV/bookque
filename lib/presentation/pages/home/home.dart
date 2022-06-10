import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/localizations.dart';
import '../../../common/styles.dart';
import '../../provider/account_provider.dart';
import '../../widgets/custom2/categories_item.dart';
import '../../widgets/custom2/double_list_books.dart';
import '../../widgets/custom2/heading_home.dart';
import '../../widgets/custom2/row_books.dart';
import '../../widgets/custom2/search_box_decoration.dart';
import '../../widgets/scroll_behavior_without_glow.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollBehaviorWithoutGlow(),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [
                          0.25,
                          1,
                        ],
                        colors: [
                          (Theme.of(context).brightness == Brightness.light)
                              ? primaryColor
                              : Theme.of(context).canvasColor,
                          Theme.of(context).canvasColor,
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppLocalizations.of(context)!
                                              .greetingsText +
                                          (context
                                                  .read<AccountProv>()
                                                  .userData!
                                                  .displayName ??
                                              'Use'),
                                      style: titleLarge,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                              CircleAvatar(
                                backgroundImage: NetworkImage(context
                                        .read<AccountProv>()
                                        .userData!
                                        .photoURL ??
                                    'https://graph.facebook.com/111968404870160/picture'),
                                radius: 40,
                                backgroundColor: Colors.transparent,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const SearchBoxDecoration(),
                          HeadingHome(
                            title: AppLocalizations.of(context)!.categoryText,
                            moreButton: true,
                            onMoreTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => CategoriesListItem(
                              //       items: listCategory,
                              //       onTapItems: () => Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (context) =>
                              //               DetailCategoryPage(
                              //                 category: listCategory[0],
                              //               ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                          CategoriesItem(onItemTap: () {
                            //     Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => DetailCategoryPage(
                            //       category: listCategory[0],
                            //     ),
                            //   ),
                            // ),
                          }),
                          HeadingHome(
                              title: AppLocalizations.of(context)!
                                  .recommendationText,
                              moreButton: false),
                          const RowBooks(),
                          HeadingHome(
                              title: AppLocalizations.of(context)!.newestText,
                              moreButton: false),
                          const DoubleListBooks(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

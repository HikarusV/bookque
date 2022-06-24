import 'package:bookque/common/state_enum.dart';
import 'package:bookque/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/localizations.dart';
import '../../../common/styles.dart';
import '../../../data/models/categories.dart';
import '../../provider/account_provider.dart';
import '../../provider/settings_provider.dart';
import '../../widgets/home/categories_item.dart';
import '../../widgets/home/double_list_books.dart';
import '../../widgets/home/heading_home.dart';
import '../../widgets/home/row_books.dart';
import '../../widgets/scroll_behavior_without_glow.dart';
import '../../widgets/search/search_box_decoration.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<HomeProvider>(context, listen: false)
      ..fetchNewsData('xxa')
      ..fetchRecomendationData());
  }

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
                          const EdgeInsets.only(left: 15, right: 15, top: 28),
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
                                      // AppLocalizations.of(context)!
                                      //         .greetingsText +
                                      getGreetingsText(context) +
                                          "\n" +
                                          (context
                                                  .watch<AccountProv>()
                                                  .userData!
                                                  .displayName ??
                                              'User'),
                                      style: titleLarge,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(3),
                                margin:
                                    const EdgeInsets.only(right: 6, left: 6),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(90)),
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(context
                                          .watch<AccountProv>()
                                          .userData!
                                          .photoURL ??
                                      'https://graph.facebook.com/111968404870160/picture'),
                                  radius: 32,
                                  backgroundColor: Colors.transparent,
                                ),
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
                          ),
                          CategoriesItem(
                            items: listCategory,
                          ),
                          HeadingHome(
                              title: AppLocalizations.of(context)!
                                  .recommendationText,
                              moreButton: false),
                          const SizedBox(
                            height: 10,
                          ),
                          Consumer<HomeProvider>(
                            builder: (context, value, _) {
                              if (value.getstaterecommendationData ==
                                  ResultState.loading) {
                                return const Center(
                                    child: CircularProgressIndicator());
                              } else if (value.getstaterecommendationData ==
                                  ResultState.hasData) {
                                return RowBooks(
                                  tagPrefix: 'rec-',
                                  listData: value.dataRandomRecomendationItems,
                                );
                              } else if (value.getstaterecommendationData ==
                                  ResultState.error) {
                                return Text(value.messageNewsData);
                              }
                              return const Text('');
                            },
                          ),
                          HeadingHome(
                              title: AppLocalizations.of(context)!.newestText,
                              moreButton: false),
                          Consumer<HomeProvider>(
                            builder: (context, value, _) {
                              if (value.getstatenewsData ==
                                  ResultState.loading) {
                                return const Text('');
                              } else if (value.getstatenewsData ==
                                  ResultState.hasData) {
                                return DoubleListBooks(
                                  tagPrefix: 'news-',
                                  listData: value.dataNewsItems,
                                );
                              } else if (value.getstatenewsData ==
                                  ResultState.error) {
                                return Text(value.messageNewsData);
                              }
                              return const Text('');
                            },
                          ),
                          context.watch<HomeProvider>().nextButton,
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

  String getGreetingsText(BuildContext context) {
    int time = context.read<SettingsProvider>().now;
    if (time >= 11 && time <= 15) {
      return 'Selamat Siang';
    } else if (time > 15 && time <= 19) {
      return 'Selamat Sore';
    } else if ((time > 19 && time <= 24) || (time >= 0 && time <= 2)) {
      return 'Selamat Malam';
    } else {
      return 'Selamat Pagi';
    }
  }
}

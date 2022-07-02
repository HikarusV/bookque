import 'package:bookque/data/items.dart';
import 'package:bookque/data/models/full_items.dart';
import 'package:bookque/presentation/widgets/detail/small_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../../../common/localizations.dart';
import '../../../common/styles.dart';
import '../../../data/models/poster.dart';
import 'bookmark_button.dart';
import 'container_detail_categories_item.dart';
import 'detail_categories_item.dart';
import 'list_categories.dart';

class DetailDataProvPages extends StatelessWidget {
  static const String routeName = 'DetailPage';

  const DetailDataProvPages(
      {Key? key,
      required this.item,
      this.withRecommendation = true,
      this.tagPrefix = 'id-'})
      : super(key: key);
  final FullItems item;
  final bool withRecommendation;
  final String tagPrefix;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 10),
              Text(
                item.title,
                style: titleLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Hero(
                tag: '$tagPrefix${item.itemid}',
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImage(
                    imageUrl: item.imageid,
                    placeholder: (context, url) => Container(
                      color: Colors.grey.shade300,
                    ),
                    errorWidget: (context, error, _) => Container(
                      color: Colors.grey.shade300,
                    ),
                    height: 240,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                item.author,
                style: titleMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              ContainerDetailCategoriesItem(
                items: ListCategories.generateListCategories(item.categories),
                type: DetailCategoriesItem(
                  text: item.categories[0],
                ),
              ),
            ],
          ),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(bottom: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BookmarkButton(
                  items: Items(
                    itemid: item.itemid,
                    title: item.title,
                    imageid: item.imageid,
                    author: item.author,
                    shortdesc: 'shortdesc',
                  ),
                ),
                const SizedBox(width: 5),
                Link(
                  target: LinkTarget.blank,
                  uri: Uri.parse((item.url.contains("https://")
                      ? item.url
                      : ("https://" + item.url))),
                  builder: (context, followLink) => SmallButton(
                    onTap: () {
                      followLink!();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.descriptionText,
              style: titleMedium,
            ),
            const SizedBox(height: 5),
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                item.longdesc,
                style: subText,
                textAlign: TextAlign.justify,
              ),
            ),
            const SizedBox(height: 15),
            withRecommendation
                ? Text(
                    AppLocalizations.of(context)!.otherRecommendationText,
                    style: titleMedium,
                  )
                : Container(),
          ],
        ),
        withRecommendation
            ? Container(
                margin: const EdgeInsets.only(bottom: 15.0),
                height: 170,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: listPoster.map((poster) {
                      return GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(poster.image),
                          ),
                        ),
                      );
                    }).toList()),
              )
            : Container(),
      ],
    );
  }
}

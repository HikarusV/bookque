import 'package:bookque/data/models/full_items.dart';
import 'package:bookque/presentation/widgets/detail/small_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/localizations.dart';
import '../../../common/styles.dart';
import '../../../data/models/poster.dart';
import 'bookmark_button.dart';
import 'container_detail_categories_item.dart';
import 'detail_categories_item.dart';

class DetailDataProvPages extends StatelessWidget {
  const DetailDataProvPages({Key? key, required this.item}) : super(key: key);
  final FullItems item;

  @override
  Widget build(BuildContext context) {
    print(item.imageid);
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
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: item.imageid,
                  placeholder: (context, url) =>
                      const CircularProgressIndicator(),
                  height: 240,
                  fit: BoxFit.fill,
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
                items: const [
                  DetailCategoriesItem(),
                  DetailCategoriesItem(),
                  DetailCategoriesItem()
                ],
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
              children: const [
                BookmarkButton(),
                SizedBox(width: 5),
                SmallButton(),
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
            Text(
              item.longdesc,
              style: subText,
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 15),
            Text(
              AppLocalizations.of(context)!.otherRecommendationText,
              style: titleMedium,
            ),
          ],
        ),
        Container(
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
        ),
      ],
    );
  }
}

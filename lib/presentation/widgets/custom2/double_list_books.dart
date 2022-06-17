import 'package:bookque/presentation/widgets/scroll_behavior_without_glow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../common/styles.dart';
import '../../../data/models/poster.dart';
import '../../pages/detail/detail.dart';
import '../images/cache_images.dart';

class DoubleListBooks extends StatelessWidget {
  const DoubleListBooks(
      {Key? key,
      this.isScroolable = false,
      this.isNetwork = true,
      required this.listData})
      : super(key: key);
  final bool isScroolable;
  final bool isNetwork;
  final List listData;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehaviorWithoutGlow(),
      child: GridView.builder(
        shrinkWrap: true,
        physics: isScroolable
            ? const ScrollPhysics()
            : const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        // crossAxisCount: 2,
        itemCount: listData.length,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          childAspectRatio: 0.6,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          maxCrossAxisExtent: 200,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Detail(id: listData[index]['itemid']),
                ),
              );
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: isNetwork
                        ? CachedNetworkImage(
                            placeholder: (context, url) => Container(
                              color: Colors.grey.shade300,
                            ),
                            imageUrl: listData[index]['imageid'],
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            listData[index]['imageid'],
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(height: 5),
                Text(listData[index]['title'],
                    style: titleSmall, overflow: TextOverflow.ellipsis),
                Text(listData[index]['author'],
                    style: subText, overflow: TextOverflow.ellipsis),
              ],
            ),
          );
        },
      ),
    );
  }
}

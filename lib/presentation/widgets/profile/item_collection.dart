import 'package:bookque/presentation/widgets/loading_widget/book_item_loading.dart';
import 'package:bookque/presentation/widgets/search/search_image_result.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../common/localizations.dart';
import '../../pages/detail/user_detail.dart';
import '../scroll_behavior_without_glow.dart';

class ItemCollection extends StatelessWidget {
  const ItemCollection({
    Key? key,
    required this.items,
    this.onLoadingItems = false,
  }) : super(key: key);
  final List items;
  final bool onLoadingItems;

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehaviorWithoutGlow(),
      child: Expanded(
        child: items.isEmpty
            ? ImageResult(
                text: AppLocalizations.of(context)!.bookProfileText,
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.65,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  if (onLoadingItems) {
                    return items[index];
                  } else {
                    final book = items[index];

                    return Hero(
                      tag: 'user-${book.itemid}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => UserDetail(
                                  id: book.itemid,
                                  index: index,
                                ),
                              ),
                            );
                          },
                          child: CachedNetworkImage(
                            imageUrl: book.imageid,
                            fit: BoxFit.cover,
                            placeholder: (context, error) =>
                                CustomShimmer.skeleton(),
                            errorWidget: (context, error, _) => Container(
                              color: Colors.grey.shade300,
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                },
              ),
      ),
    );
  }
}

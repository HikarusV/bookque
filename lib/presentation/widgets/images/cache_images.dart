import 'package:bookque/data/cache/cache_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CahceImages extends StatelessWidget {
  final String id;
  final String urlImages;
  const CahceImages({Key? key, required this.id, required this.urlImages})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (itemsImage.containsKey(id)) {
      return itemsImage[id]!;
    }
    itemsImage[id] = SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
          key: Key(urlImages),
          placeholder: (context, url) => Container(
            color: Colors.grey.shade300,
          ),
          imageUrl: urlImages,
          fit: BoxFit.cover,
        ),
      ),
    );
    return itemsImage[id]!;
  }
}

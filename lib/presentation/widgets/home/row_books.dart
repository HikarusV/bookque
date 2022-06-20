import 'package:bookque/common/styles.dart';
import 'package:bookque/data/items.dart';
import 'package:bookque/presentation/pages/detail/detail.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RowBooks extends StatelessWidget {
  const RowBooks({Key? key, required this.listData}) : super(key: key);
  final List<Items> listData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listData.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: const EdgeInsets.only(right: 10),
            width: 124,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Detail(id: listData[index].itemid),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      placeholder: (context, url) => Container(
                        color: Colors.grey.shade300,
                      ),
                      imageUrl: listData[index].imageid,
                      width: 124,
                      height: 170,
                      fit: BoxFit.fill,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    listData[index].title,
                    overflow: TextOverflow.ellipsis,
                    style: subText,
                  ),
                  Text(
                    listData[index].author,
                    overflow: TextOverflow.ellipsis,
                    style: authorTextSmall,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

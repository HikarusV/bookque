import 'package:flutter/material.dart';
import '../../../common/styles.dart';
import '../../../data/models/poster.dart';
import '../../pages/detail/detail.dart';

class DoubleListBooks extends StatelessWidget {
  const DoubleListBooks({Key? key, this.isScroolable = false})
      : super(key: key);
  final bool isScroolable;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: isScroolable
          ? const ScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      children: listPoster.map(
        (poster) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Detail(),
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
                    child: Image.asset(
                      poster.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Text('Judul',
                    style: titleSmall, overflow: TextOverflow.ellipsis),
                Text('Penulis',
                    style: subText, overflow: TextOverflow.ellipsis),
              ],
            ),
          );
        },
      ).toList(),
    );
  }
}

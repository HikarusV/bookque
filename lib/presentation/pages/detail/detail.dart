import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:bookque/presentation/widgets/detail/bookmark_button.dart';
import 'package:bookque/presentation/widgets/detail/detail_categories_item.dart';
import 'package:flutter/material.dart';

import '../../../common/styles.dart';
import '../../../data/models/poster.dart';
import '../../widgets/detail/container_detail_categories_item.dart';
import '../../widgets/detail/small_button.dart';

class Detail extends StatelessWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Detail',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'Mantappu Jiwa *Buku Latihan',
                      style: titleLarge,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Image.asset('assets/buku1.png', height: 240),
                    const SizedBox(height: 10),
                    Text(
                      'Jerome Polin Sijabat',
                      style: titleMedium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const ContainerDetailCategoriesItem(
                      items: [
                        DetailCategoriesItem(),
                        DetailCategoriesItem(),
                        DetailCategoriesItem()
                      ],
                      type: DetailCategoriesItem(
                        text: 'E-Book',
                      ),
                    )
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
                    'Deskripsi',
                    style: titleMedium,
                  ),
                  const SizedBox(height: 5),
                  Text(
                    'Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec rutrum congue leo eget malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque.',
                    style: subText,
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    'Rekomendasi Lainnya',
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
                      return InkWell(
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
          ),
        ),
      ),
    );
  }
}

import 'package:bookque/common/styles.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:bookque/presentation/widgets/detail/bookmark_button.dart';
import 'package:bookque/presentation/widgets/detail/container_detail_categories_item.dart';
import 'package:bookque/presentation/widgets/detail/detail_categories_item.dart';
import 'package:bookque/presentation/widgets/detail/report_dialog.dart';
import 'package:bookque/presentation/widgets/detail/small_button.dart';
import 'package:bookque/presentation/widgets/scroll_behavior_without_glow.dart';
import 'package:flutter/material.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Detail',
      actions: <Widget>[
        PopupMenuButton(
            icon: const Icon(
              Icons.more_vert,
              size: 28,
            ),
            onSelected: (value) {
              if (value == MenuItem.item1) {}
              else if (value == MenuItem.item2) {}
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: MenuItem.item1,
                child: Row(
                  children: [
                    const Icon(
                      Icons.create,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 5),
                    Text('Ubah', style: titleSmall),
                  ],
                ),
              ),
              PopupMenuItem(
                value: MenuItem.item2,
                child: Row(
                  children: [
                    const Icon(
                      Icons.delete,
                      color: Colors.black,
                    ),
                    const SizedBox(width: 5),
                    Text('Hapus', style: titleSmall),
                  ],
                ),
              ),
            ]),
      ],
      child: ScrollConfiguration(
        behavior: ScrollBehaviorWithoutGlow(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
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
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum MenuItem {
  item1,
  item2,
}
import 'package:bookque/common/styles.dart';
import 'package:bookque/presentation/pages/upload/upload.dart';
import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:bookque/presentation/provider/profile_items_provider.dart';
import 'package:bookque/presentation/provider/upload_provider.dart';
import 'package:bookque/presentation/provider/user_item_detail.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:bookque/presentation/widgets/detail/bookmark_button.dart';
import 'package:bookque/presentation/widgets/detail/container_detail_categories_item.dart';
import 'package:bookque/presentation/widgets/detail/detail_categories_item.dart';
import 'package:bookque/presentation/widgets/detail/small_button.dart';
import 'package:bookque/presentation/widgets/scroll_behavior_without_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/state_enum.dart';
import '../../../data/models/full_items.dart';
import '../../widgets/detail/detail_data_prov_pages.dart';

class UserDetail extends StatefulWidget {
  const UserDetail({Key? key, required this.id, required this.index})
      : super(key: key);
  final String id;
  final int index;

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<UserDetailItemsProvider>(context, listen: false)
          ..fetchDetailItemById(widget.id));
  }

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
          onSelected: (value) async {
            if (value == MenuItem.item1) {
              await Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => Upload(
                    isUpdateModule: true,
                    items: context
                        .read<UserDetailItemsProvider>()
                        .dataUserDetailItems[widget.id],
                  ),
                ),
              );
            } else if (value == MenuItem.item2) {
              showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(),
                ),
              );
              await context
                  .read<UploadUpdateItemProvider>()
                  .deletedData(
                    userId: context.read<AccountProv>().userData!.uid,
                    id: widget.id,
                  )
                  .then((value) {
                Navigator.pop(context);
                context.read<ProfileItemsProvider>().removeData(widget.index);
              });
              Navigator.pop(context);
            }
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
          ],
        ),
      ],
      child: ScrollConfiguration(
        behavior: ScrollBehaviorWithoutGlow(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Consumer<UserDetailItemsProvider>(
              builder: (context, value, _) {
                if (value.stateUserDetailItems == ResultState.loading) {
                  return const Text('Loading');
                } else if (value.stateUserDetailItems == ResultState.hasData &&
                    value.dataUserDetailItems.containsKey(widget.id)) {
                  return DetailDataProvPages(
                    item: value.dataUserDetailItems[widget.id] ?? FullItems(),
                    withRecommendation: false,
                  );
                } else if (value.stateUserDetailItems == ResultState.error) {
                  return Text(value.userDetailItemsMessage);
                }
                return const Text('Loading');
              },
            ),

            // Column(
            //   children: [
            //     Container(
            //       alignment: Alignment.center,
            //       child: Column(
            //         children: [
            //           const SizedBox(height: 10),
            //           Text(
            //             'Mantappu Jiwa *Buku Latihan',
            //             style: titleLarge,
            //             textAlign: TextAlign.center,
            //           ),
            //           const SizedBox(height: 10),
            //           ClipRRect(
            //             borderRadius: BorderRadius.circular(12),
            //             child: Image.asset('assets/buku1.png', height: 240),
            //           ),
            //           const SizedBox(height: 10),
            //           Text(
            //             'Jerome Polin Sijabat',
            //             style: titleMedium,
            //             textAlign: TextAlign.center,
            //           ),
            //           const SizedBox(height: 10),
            //           const ContainerDetailCategoriesItem(
            //             items: [
            //               DetailCategoriesItem(),
            //               DetailCategoriesItem(),
            //               DetailCategoriesItem(),
            //               DetailCategoriesItem(),
            //               DetailCategoriesItem(),
            //             ],
            //             type: DetailCategoriesItem(
            //               text: 'E-Book',
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //     Center(
            //       child: Container(
            //         margin: const EdgeInsets.only(bottom: 15),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: const [
            //             SizedBox(width: 5),
            //             SmallButton(),
            //           ],
            //         ),
            //       ),
            //     ),
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         Text(
            //           'Deskripsi',
            //           style: titleMedium,
            //         ),
            //         const SizedBox(height: 5),
            //         Text(
            //           'Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus. Donec rutrum congue leo eget malesuada. Curabitur non nulla sit amet nisl tempus convallis quis ac lectus. Donec rutrum congue leo eget malesuada. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec velit neque.',
            //           style: subText,
            //           textAlign: TextAlign.justify,
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
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

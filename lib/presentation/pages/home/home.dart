import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../data/models/categories.dart';
import '../../provider/account_provider.dart';
import '../../widgets/custom2/search_box_decoration.dart';
import '../../widgets/custom2/categories_item.dart';
import '../../widgets/scroll_behavior_without_glow.dart';
import '../../widgets/custom2/heading_home.dart';
import '../../widgets/custom2/row_books.dart';
import '../../widgets/custom2/double_list_books.dart';
import '../categories/categories_list_item.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScrollConfiguration(
        behavior: ScrollBehaviorWithoutGlow(),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Stack(
                children: [
                  Container(
                    height: 280,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: const [
                          0.25,
                          1,
                        ],
                        colors: [
                          (Theme.of(context).brightness == Brightness.light)
                              ? Colors.blue.shade200
                              : Theme.of(context).canvasColor,
                          Theme.of(context).canvasColor,
                        ],
                      ),
                    ),
                  ),
                  SafeArea(
                    child: Container(
                      margin:
                          const EdgeInsets.only(left: 15, right: 15, top: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Hello, ${context.read<AccountProv>().userData!.displayName ?? 'Kosong broh'}',
                                      style: GoogleFonts.poppins(fontSize: 24),
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              ),
                              CircleAvatar(
                                backgroundImage: NetworkImage(context
                                        .read<AccountProv>()
                                        .userData!
                                        .photoURL ??
                                    'https://image.shutterstock.com/image-vector/man-icon-vector-260nw-1040084344.jpg'),
                                radius: 40,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const SearchBoxDecoration(),
                          HeadingHome(
                            title: 'Kategori',
                            moreButton: true,
                            onMoreTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => CategoriesListItem(
                              //       items: listCategory,
                              //       onTapItems: () => Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //           builder: (context) =>
                              //               DetailCategoryPage(
                              //                 category: listCategory[0],
                              //               ),
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // );
                            },
                          ),
                          CategoriesItem(onItemTap: () {
                            //     Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => DetailCategoryPage(
                            //       category: listCategory[0],
                            //     ),
                            //   ),
                            // ),
                          }),
                          const HeadingHome(
                              title: 'Rekomendasi', moreButton: false),
                          const RowBooks(),
                          const HeadingHome(
                              title: 'Terbaru', moreButton: false),
                          const DoubleListBooks(),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

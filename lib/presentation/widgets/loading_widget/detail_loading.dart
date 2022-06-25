import 'package:bookque/presentation/widgets/loading_widget/book_item_loading.dart';
import 'package:flutter/material.dart';

class DetailLoading extends StatelessWidget {
  const DetailLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              const SizedBox(height: 10),
              SizedBox(
                child: CustomShimmer.skeleton(),
                height: 28,
                width: 220,
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 240,
                width: 170,
                child: CustomShimmer.skeleton(),
              ),
              const SizedBox(height: 15),
              SizedBox(
                child: CustomShimmer.skeleton(),
                height: 28,
                width: 220,
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(bottom: 20, top: 3),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomShimmer.catItemLoading(),
                        CustomShimmer.catItemLoading(),
                        CustomShimmer.catItemLoading(),
                      ],
                    ),
                  ],
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
              children: [
                CustomShimmer.roundSquare(height: 40, width: 40),
                const SizedBox(width: 5),
                CustomShimmer.roundSquare(height: 40, width: 160),
              ],
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            CustomShimmer.roundSquare(height: 25, width: 100),
            const SizedBox(height: 5),
            CustomShimmer.roundSquare(height: 105, width: double.infinity),
            const SizedBox(height: 15),
            // withRecommendation
            //     ? Text(
            //         AppLocalizations.of(context)!.otherRecommendationText,
            //         style: titleMedium,
            //       )
            //     : Container(),
          ],
        ),
        // withRecommendation
        //     ? Container(
        //         margin: const EdgeInsets.only(bottom: 15.0),
        //         height: 170,
        //         child: ListView(
        //             scrollDirection: Axis.horizontal,
        //             children: listPoster.map((poster) {
        //               return GestureDetector(
        //                 onTap: () {},
        //                 child: Padding(
        //                   padding: const EdgeInsets.only(left: 5.0, right: 5.0),
        //                   child: ClipRRect(
        //                     borderRadius: BorderRadius.circular(12),
        //                     child: Image.asset(poster.image),
        //                   ),
        //                 ),
        //               );
        //             }).toList()),
        //       )
        //     : Container(),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../common/styles.dart';

class ImageNoDataResult extends StatelessWidget {
  const ImageNoDataResult(
      {Key? key,
      required this.text,
      this.pathImage = 'assets/search_image2.png'})
      : super(key: key);
  final String text;
  final String pathImage;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Center(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Image.asset(
                pathImage,
                width: 150,
                height: 150,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: titleSemiMedium,
              ),
            )
          ],
        ),
      ),
    );
  }
}

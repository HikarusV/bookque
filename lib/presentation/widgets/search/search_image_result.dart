import 'package:flutter/material.dart';

import '../../../common/styles.dart';

class ImageResult extends StatelessWidget {
  const ImageResult(
      {Key? key,
      required this.text,
      this.pathImage = 'assets/search_image1.png',
      this.withRefresh = false,
      this.onPressed})
      : super(key: key);
  final String text;
  final String pathImage;
  final bool withRefresh;
  final Function()? onPressed;

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
              child: Column(
                children: [
                  Text(
                    text,
                    textAlign: TextAlign.center,
                    style: titleSemiMedium,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  withRefresh
                      ? IconButton(
                          onPressed: onPressed,
                          icon: const Icon(Icons.refresh),
                        )
                      : Container()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';

class HeadingVerification extends StatelessWidget {
  const HeadingVerification(
      {Key? key, this.title = 'Title', this.subTitle = 'Subtitle'})
      : super(key: key);

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15, top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              title,
              style: titleMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: Expanded(
              child: Image.asset('assets/verification.png', height: 200),
            ),
          ),
          const SizedBox(height: 15),
          Center(
            child: Text(
              subTitle,
              style: titleSmall,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

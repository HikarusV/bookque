import 'package:flutter/material.dart';

import '../../../common/styles.dart';

class BottomTextButton extends StatelessWidget {
  const BottomTextButton(
      {Key? key,
      required this.onTap,
      this.textButton = 'Button',
      this.text = ''})
      : super(key: key);
  final Function() onTap;

  final String text;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: titleSmall),
          GestureDetector(
            onTap: onTap,
            child: Text(textButton, style: titleButton),
          )
        ],
      ),
    );
  }
}

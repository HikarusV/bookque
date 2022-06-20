import 'package:flutter/material.dart';

class ImageButton extends StatelessWidget {
  const ImageButton({
    Key? key,
    this.iconSize = 60,
    required this.image,
    required this.onPressed,
  }) : super(key: key);
  final double iconSize;
  final ImageProvider<Object> image;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Image(
        image: image,
        width: iconSize,
      ),
    );
  }
}

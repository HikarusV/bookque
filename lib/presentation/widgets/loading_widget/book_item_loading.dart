import 'package:flutter/material.dart';

class CustomShimmer {
  static Color baseColor = Colors.grey.shade300;

  static Widget skeleton() {
    return Container(
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(12.0),
      ),
    );
  }

  static List<Widget> bookItem(int count) {
    return List<Widget>.generate(count, (index) => skeleton());
  }
}

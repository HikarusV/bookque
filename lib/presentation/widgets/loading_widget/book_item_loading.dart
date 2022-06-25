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

  static Widget catItemLoading() {
    return Container(
      height: 25,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Center(
          child: Text('                  '),
        ),
      ),
    );
  }

  static Widget roundSquare({double height = 30, double width = 40}) {
    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: baseColor,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  static List<Widget> bookItem(int count) {
    return List<Widget>.generate(count, (index) => skeleton());
  }
}

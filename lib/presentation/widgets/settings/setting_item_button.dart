import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class SettingItemButton extends StatelessWidget {
  const SettingItemButton({
    Key? key,
    this.title = '',
    required this.itemsName,
    required this.controller,
    this.onItemSelected,
    this.width = 95,
  }) : super(key: key);

  final String title;
  final List itemsName;
  final double width;
  final GroupButtonController controller;
  final Function(dynamic, int, bool)? onItemSelected;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < itemsName.length; i++) {}

    return Container(
      margin: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: buttonMediumBlack),
          const SizedBox(height: 10),
          GroupButton(
            controller: controller,
            buttons: itemsName,
            onSelected: onItemSelected,
            buttonBuilder: (selected, name, context) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: width,
                  height: 35,
                  alignment: Alignment.center,
                  color: selected ? primaryColor : secondaryColor,
                  child: Text(
                    name.toString(),
                    style: selected ? subTextWhite : subTextGreyOld,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

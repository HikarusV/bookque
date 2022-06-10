import 'package:bookque/common/localizations.dart';
import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class SettingItemButton extends StatelessWidget {
  const SettingItemButton({
    Key? key,
    required this.itemsName,
    required this.controller,
    this.onItemSelected,
  }) : super(key: key);

  final List itemsName;
  final GroupButtonController controller;
  final Function(dynamic, int, bool)? onItemSelected;

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < itemsName.length; i++) {}

    return Container(
      // width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(15.0),
      // padding: const EdgeInsets.all(10.0),
      // decoration: BoxDecoration(
      //   border: Border.all(color: primaryColor),
      //   borderRadius: BorderRadius.circular(12),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.themeText,
              style: buttonMediumBlack),
          const SizedBox(height: 5),
          GroupButton(
            controller: controller,
            buttons: itemsName,
            onSelected: onItemSelected,
            buttonBuilder: (selected, name, context) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  width: 95,
                  height: 35,
                  alignment: Alignment.center,
                  color: selected ? primaryColor : secondaryColor,
                  child: Text(
                    name.toString(),
                    style: selected ? subTextWhite : subTextGrey,
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

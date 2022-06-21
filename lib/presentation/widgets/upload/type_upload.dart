import 'package:bookque/common/localizations.dart';
import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../provider/settings_provider.dart';

class TypeUpload extends StatelessWidget {
  const TypeUpload({
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
    return Container(
      margin: const EdgeInsets.only(top: 12, bottom: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppLocalizations.of(context)!.themeText, style: subText),
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
                  color: selected
                      ? Theme.of(context).colorScheme.primary
                      : (context.read<SettingsProvider>().darkTheme)
                          ? Theme.of(context).colorScheme.surfaceVariant
                          : secondaryColor,
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

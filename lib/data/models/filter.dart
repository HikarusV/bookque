import 'package:flutter/material.dart';

import '../../common/localizations.dart';

class Filters {
  String name;
  bool isSelected;

  Filters({
    required this.name,
    required this.isSelected,
  });
}

List<Filters> getListFilter(BuildContext context) {
  return [
    Filters(
      name: AppLocalizations.of(context)!.sortUploadItem1,
      isSelected: false,
    ),
    Filters(
      name: AppLocalizations.of(context)!.sortUploadItem2,
      isSelected: false,
    ),
    // Filters(
    //   name: AppLocalizations.of(context)!.sortUploadItem3,
    //   isSelected: false,
    // ),
  ];
}

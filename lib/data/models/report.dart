import 'package:flutter/material.dart';

import '../../common/localizations.dart';

class Report {
  String name;
  bool isSelected;

  Report({
    required this.name,
    required this.isSelected,
  });
}

List<Report> getListReport(BuildContext context) {
  return [
    Report(
      name: AppLocalizations.of(context)!.reportItem1,
      isSelected: false,
    ),
    Report(
      name: AppLocalizations.of(context)!.reportItem2,
      isSelected: false,
    ),
    Report(
      name: AppLocalizations.of(context)!.reportItem3,
      isSelected: false,
    ),
    Report(
      name: AppLocalizations.of(context)!.reportItem4,
      isSelected: false,
    ),
    Report(
      name: AppLocalizations.of(context)!.reportItem5,
      isSelected: false,
    ),
  ];
}

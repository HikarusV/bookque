import 'package:bookque/main.dart';
import 'package:flutter/material.dart';

import '../widgets/settings/setting_card_list.dart';

class LocalizationProvider extends ChangeNotifier {
  LocalizationProvider() {
    _locale = L10n.all[globalLocalData.getInt('languageIndex') ?? 0];
  }

  Locale _locale = const Locale("id");
  Locale get locale => _locale;

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }
}

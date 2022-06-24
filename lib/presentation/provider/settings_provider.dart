import 'package:bookque/main.dart';
import 'package:bookque/presentation/widgets/settings/setting_card_list.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:intl/intl.dart';

class SettingsProvider with ChangeNotifier {
  SettingsProvider() {
    themes.selectIndex(globalLocalData.getInt('themesIndex') ?? 0);
    language.selectIndex(globalLocalData.getInt('languageIndex') ?? 0);
    darkTheme = globalLocalData.getBool('darkTheme') ?? false;
    valueLanguage = globalLocalData.getString('valueLang') ?? 'Indonesia';
    fontScaleValue = globalLocalData.getDouble('fontScale') ?? 1;

    _now = int.parse(DateFormat('HH').format(DateTime.now()));
  }

  final List<double> scale = [1, 1.1, 1.2];

  late int _now;

  late bool darkTheme;

  late String valueLanguage;

  late double fontScaleValue;

  int get now => _now;

  final themes = GroupButtonController()
    ..selectIndex(globalLocalData.getInt('themesIndex') ?? 0);
  final language = GroupButtonController()
    ..selectIndex(globalLocalData.getInt('languageIndex') ?? 0);
  final fontScale = GroupButtonController()
    ..selectIndex(globalLocalData.getInt('fontScaleIndex') ?? 0);

  void changeTheme(bool value) {
    darkTheme = value;
    globalLocalData.setInt('themesIndex', value ? 1 : 0);
    globalLocalData.setBool('darkTheme', value);
    notifyListeners();
  }

  void changeFontScalling(int index) {
    fontScaleValue = scale[index];
    globalLocalData.setInt('fontScaleIndex', index);
    globalLocalData.setDouble('fontScale', fontScaleValue);
    notifyListeners();
  }

  Locale changelanguage(String value) {
    valueLanguage = value;
    globalLocalData.setString('valueLang', value);
    int index = 0;
    for (String i in L10n.languageName) {
      if (i == value) {
        break;
      }
      index++;
    }
    notifyListeners();
    int x = L10n.languageName.indexOf(value);
    globalLocalData.setInt('languageIndex', x);
    return L10n.all[index];
  }
}

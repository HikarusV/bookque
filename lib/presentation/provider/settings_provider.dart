import 'package:bookque/presentation/widgets/settings/setting_card_list.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

class SettingsProvider with ChangeNotifier {
  SettingsProvider({this.valueLanguage = 'Indonesia'}) {
    themes.selectIndex(0);
    language.selectIndex(0);
  }

  bool darkTheme = false;

  late String valueLanguage;

  final themes = GroupButtonController();
  final language = GroupButtonController();

  void changeTheme(bool value) {
    darkTheme = value;
    print('ganti tema ke ${value ? Brightness.dark : Brightness.light}');
    notifyListeners();
  }

  Locale changelanguage(String value) {
    valueLanguage = value;
    int index = 0;
    for (String i in L10n.languageName) {
      if (i == value) {
        break;
      }
      index++;
    }
    notifyListeners();
    return L10n.all[index];
  }
}

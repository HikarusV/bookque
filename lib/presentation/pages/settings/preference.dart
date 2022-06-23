import 'package:bookque/presentation/provider/localizations_provider.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/localizations.dart';
import '../../provider/settings_provider.dart';
import '../../widgets/settings/setting_item_button.dart';

class Preference extends StatelessWidget {
  const Preference({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppLocalizations.of(context)!.appreanceText,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingItemButton(
              title: AppLocalizations.of(context)!.themeText,
              controller: context.read<SettingsProvider>().themes,
              itemsName: [
                AppLocalizations.of(context)!.themeItem1,
                AppLocalizations.of(context)!.themeItem2,
              ],
              onItemSelected: (name, i, isSelected) {
                context.read<SettingsProvider>().themes.selectIndex(i);
                context.read<SettingsProvider>().changeTheme(i == 1);
              },
            ),
            SettingItemButton(
              title: AppLocalizations.of(context)!.languageText,
              controller: context.read<SettingsProvider>().language,
              itemsName: [
                AppLocalizations.of(context)!.languageItem1,
                AppLocalizations.of(context)!.languageItem2,
              ],
              onItemSelected: (name, i, isSelected) {
                context.read<SettingsProvider>().language.selectIndex(i);
                Locale id = context
                    .read<SettingsProvider>()
                    .changelanguage(name.toString());
                context.read<LocalizationProvider>().setLocale(id);
              },
            ),
            SettingItemButton(
              width: 60,
              title: 'Font Scaling',
              controller: context.read<SettingsProvider>().fontScale,
              itemsName: const ['1x', '1.1x', '1.2x'],
              onItemSelected: (name, i, isSelected) {
                // context.read<SettingsProvider>().themes.selectIndex(i);
                // context.read<SettingsProvider>().changeTheme(i == 1);
              },
            ),
          ],
        ),
      ),
    );
  }
}

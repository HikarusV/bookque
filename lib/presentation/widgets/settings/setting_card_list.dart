import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';

import '../../../common/localizations.dart';

class SettingCardList extends StatefulWidget {
  const SettingCardList({Key? key}) : super(key: key);

  @override
  State<SettingCardList> createState() => _SettingCardListState();
}

class _SettingCardListState extends State<SettingCardList> {
  var choiceTheme = '';
  var choiceLanguage = '';

  final controller = GroupButtonController();

  @override
  Widget build(BuildContext context) {
    final themeList = [
      AppLocalizations.of(context)!.themeItem1,
      AppLocalizations.of(context)!.themeItem2,
    ];

    final languageList = [
      AppLocalizations.of(context)!.languageItem1,
      AppLocalizations.of(context)!.languageItem2,
    ];

    print(languageList);
    controller.selectIndex(0);
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Text(AppLocalizations.of(context)!.themeText,
                  style: buttonMediumBlack),
              const SizedBox(height: 5),
              SizedBox(
                height: 35,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: themeList.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            width: 95,
                            height: 35,
                            color: choiceTheme == themeList[index]
                                ? primaryColor
                                : secondaryColor,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  choiceTheme = themeList[index];
                                });
                              },
                              child: Text(
                                themeList[index],
                                style: choiceTheme == themeList[index]
                                    ? subTextWhite
                                    : subTextGrey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 55,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class L10n {
  static final all = [
    const Locale('id'),
    const Locale('en'),
  ];

  static final List<String> languageName = [
    'Indonesia',
    'English',
  ];
}

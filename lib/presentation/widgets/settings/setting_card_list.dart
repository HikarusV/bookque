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

        // Container(
        //   width: MediaQuery.of(context).size.width,
        //   margin: const EdgeInsets.all(15.0),
        //   padding: const EdgeInsets.all(10.0),
        //   decoration: BoxDecoration(
        //     border: Border.all(color: primaryColor),
        //     borderRadius: BorderRadius.circular(12),
        //   ),
        //   child: Column(
        //     children: [
        //       Text(AppLocalizations.of(context)!.languageText,
        //           style: buttonMediumBlack),
        //       const SizedBox(height: 5),
        //       SizedBox(
        //         height: 35,
        //         child: ListView.separated(
        //           scrollDirection: Axis.horizontal,
        //           itemCount: languageList.length,
        //           shrinkWrap: true,
        //           itemBuilder: (context, index) {
        //             return Row(
        //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //               children: [
        //                 ClipRRect(
        //                   borderRadius: BorderRadius.circular(12),
        //                   child: Container(
        //                     width: 95,
        //                     height: 35,
        //                     color: choiceLanguage == languageList[index]
        //                         ? primaryColor
        //                         : secondaryColor,
        //                     child: TextButton(
        //                       onPressed: () {
        //                         // final localizationProvider =
        //                         //     Provider.of<LocalizationProvider>(context,
        //                         //         listen: false);
        //                         // localizationProvider.setLocale(locale);
        //                         choiceLanguage = languageList[index];
        //                         Locale value = context
        //                             .read<SettingsProvider>()
        //                             .changelanguage(languageList[index]);
        //                       },
        //                       child: Text(
        //                         languageList[index],
        //                         style: choiceLanguage == languageList[index]
        //                             ? subTextWhite
        //                             : subTextGrey,
        //                       ),
        //                     ),
        //                   ),
        //                 ),
        //               ],
        //             );
        //           },
        //           separatorBuilder: (context, index) => const SizedBox(
        //             width: 55,
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('id'),
  ];

  static final List<String> languageName = [
    'English',
    'Indonesia',
  ];
}

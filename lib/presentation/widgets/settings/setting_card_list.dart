import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';

class SettingCardList extends StatefulWidget {
  const SettingCardList({Key? key, this.text = 'Text'}) : super(key: key);

  final String text;

  @override
  State<SettingCardList> createState() => _SettingCardListState();
}

class _SettingCardListState extends State<SettingCardList> {
  final themeList = [
    'Terang',
    'Gelap',
  ];

  var choice = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.all(15.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(widget.text, style: buttonMediumBlack),
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
                        color: choice == themeList[index]
                            ? primaryColor
                            : secondaryColor,
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              choice = themeList[index];
                            });
                          },
                          child: Text(
                            themeList[index],
                            style:
                            choice == themeList[index] ? subTextWhite : subTextGrey,
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
    );
  }
}

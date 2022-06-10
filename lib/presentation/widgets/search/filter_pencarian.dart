import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';

import '../../../common/localizations.dart';

class FilterPencarian extends StatefulWidget {
  const FilterPencarian({Key? key}) : super(key: key);

  @override
  State<FilterPencarian> createState() => _FilterPencarianState();
}

class _FilterPencarianState extends State<FilterPencarian> {
  final listPencarian = [
    'Judul',
    'Penulis',
    'User',
  ];

  var choiceType = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.searchFilterText,
          style: titleSmall,
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.only(left: 20),
          alignment: Alignment.topLeft,
          height: 35,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: listPencarian.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      width: 95,
                      height: 35,
                      color: choiceType == listPencarian[index]
                          ? primaryColor
                          : secondaryColor,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            choiceType = listPencarian[index];
                          });
                        },
                        child: Text(
                          listPencarian[index],
                          style: choiceType == listPencarian[index]
                              ? subTextWhite
                              : subTextGrey,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 15,
                  ),
                ],
              );
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
      ],
    );
  }
}

import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';

import '../../../common/localizations.dart';

class FilterJenis extends StatefulWidget {
  const FilterJenis({Key? key}) : super(key: key);

  @override
  State<FilterJenis> createState() => _FilterJenisState();
}

class _FilterJenisState extends State<FilterJenis> {
  final listPencarian = [
    'Buku',
    'Jurnal',
    'Artikel',
  ];

  var choiceType = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.typeFilterText,
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
      ],
    );
  }
}

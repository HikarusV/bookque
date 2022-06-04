import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          'Jenis',
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600),
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
                          ? Colors.blue
                          : Colors.blue.shade100,
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            choiceType = listPencarian[index];
                          });
                        },
                        child: Text(
                          listPencarian[index],
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
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

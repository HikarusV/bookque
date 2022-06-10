import 'package:flutter/material.dart';

import '../../../common/localizations.dart';
import '../../../common/styles.dart';

class ChooseCategories extends StatelessWidget {
  const ChooseCategories({Key? key, this.text = 'Pilih Kategori', this.onTap})
      : super(key: key);
  final String text;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.categoryText,
              style: subText,
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 50,
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              decoration: BoxDecoration(
                color: const Color(0xffE7F2FF),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppLocalizations.of(context)!
                          .categoryUploadPlaceholderText,
                      style: hintTitle,
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: primaryColor,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

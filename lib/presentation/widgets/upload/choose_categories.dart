import 'package:bookque/presentation/provider/upload_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                    Consumer<UploadUpdateItemProvider>(
                      builder: (context, value, _) => Expanded(
                        child: Container(
                          child: (value.itemCat.items.isNotEmpty)
                              ? Text(
                                  value.itemCat.items
                                      .toString()
                                      .substring(
                                          1,
                                          (value.itemCat.items
                                                  .toString()
                                                  .length -
                                              1))
                                      .replaceAll(RegExp(r'\s+'), ''),
                                  overflow: TextOverflow.ellipsis,
                                  style: subText,
                                )
                              : Text(
                                  AppLocalizations.of(context)!
                                      .categoryUploadPlaceholderText,
                                  style: subText,
                                ),
                        ),
                      ),
                    ),
                    const Flexible(
                      flex: 0,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: primaryColor,
                        size: 18,
                      ),
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

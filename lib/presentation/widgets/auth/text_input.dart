import 'package:bookque/presentation/provider/settings_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../common/styles.dart';

class TextInput extends StatelessWidget {
  const TextInput({
    Key? key,
    required this.controller,
    this.title = '',
    this.textHint = 'Text Hint',
    this.maxLines = 1,
    this.minLines = 1,
    this.maxLength,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final String textHint;
  final int maxLines;
  final int minLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: subText,
          ),
          const SizedBox(
            height: 5,
          ),
          Stack(
            children: [
              Container(
                height: (minLines == 1) ? 50 : minLines * 25,
                decoration: BoxDecoration(
                  color: (context.read<SettingsProvider>().darkTheme)
                      ? Theme.of(context).colorScheme.surfaceVariant
                      : const Color(0xffE7F2FF),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              TextField(
                controller: controller,
                maxLines: maxLines,
                minLines: minLines,
                maxLength: maxLength,
                maxLengthEnforcement:
                    (maxLength == null) ? null : MaxLengthEnforcement.enforced,
                style: TextStyle(
                  fontStyle: subText.fontStyle,
                  fontSize: subText.fontSize,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
                decoration: InputDecoration(
                  hintText: textHint,
                  hintStyle: hintTitle,
                  contentPadding: const EdgeInsets.only(
                      top: 13, bottom: 12, left: 15, right: 15),
                  isDense: true,
                  border: InputBorder.none,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../../common/styles.dart';
import '../../provider/settings_provider.dart';

class NameTag extends StatefulWidget {
  const NameTag({Key? key, this.text = 'MyUsername', required this.controller})
      : super(key: key);
  final String text;
  final TextEditingController controller;

  @override
  State<NameTag> createState() => _NameTagState();
}

class _NameTagState extends State<NameTag> {
  bool isEdit = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Username',
          style: subText,
        ),
        const SizedBox(
          height: 5,
        ),
        isEdit
            ? Stack(
                children: [
                  Container(
                    height: 45,
                    alignment: Alignment.centerRight,
                    decoration: BoxDecoration(
                      color: (context.read<SettingsProvider>().darkTheme)
                          ? Theme.of(context).colorScheme.surfaceVariant
                          : const Color(0xffE7F2FF),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  TextField(
                    controller: widget.controller,
                    autofocus: true,
                    maxLength: 13,
                    maxLengthEnforcement: MaxLengthEnforcement.enforced,
                    style: TextStyle(
                      fontStyle: subText.fontStyle,
                      fontSize: subText.fontSize,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
                    decoration: InputDecoration(
                      hintStyle: hintTitle,
                      contentPadding: const EdgeInsets.only(
                          top: 13, bottom: 12, left: 15, right: 15),
                      isDense: true,
                      border: InputBorder.none,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    top: 0,
                    // bottom: 50,
                    child: GestureDetector(
                      onTap: () => setState(() {
                        isEdit = false;
                      }),
                      child: Container(
                        padding: const EdgeInsets.only(right: 15),
                        alignment: Alignment.centerRight,
                        width: 65,
                        height: 45,
                        child: const Icon(
                          Icons.done,
                          size: 20,
                        ),
                      ),
                    ),
                  )
                ],
              )
            : Container(
                height: 45,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  color: (context.read<SettingsProvider>().darkTheme)
                      ? Theme.of(context).colorScheme.surfaceVariant
                      : const Color(0xffE7F2FF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 10, bottom: 12, left: 15, right: 15),
                          child: Text(widget.controller.text),
                        )),
                    Flexible(
                      flex: 0,
                      child: GestureDetector(
                        onTap: () => setState(() {
                          isEdit = true;
                        }),
                        child: Container(
                          padding: const EdgeInsets.only(right: 15),
                          alignment: Alignment.centerRight,
                          width: 65,
                          height: 45,
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ],
    );
  }
}

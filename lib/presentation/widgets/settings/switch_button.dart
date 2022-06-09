import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';

class SwitchButton extends StatefulWidget {
  const SwitchButton({Key? key, this.text = 'Text'}) : super(key: key);

  final String text;

  @override
  State<SwitchButton> createState() => _SwitchButtonState();
}

class _SwitchButtonState extends State<SwitchButton> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 15.0),
      decoration: BoxDecoration(
        border: Border.all(color: primaryColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              widget.text,
              style: buttonMediumBlack,
            ),
          ),
          Switch(
            activeColor: primaryColor,
            value: status,
            onChanged: (value) {
              setState(() {
                status = value;
              });
            },
          ),
        ],
      ),
    );
  }
}

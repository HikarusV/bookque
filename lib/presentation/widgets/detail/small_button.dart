import 'package:flutter/material.dart';

import '../../../common/localizations.dart';
import '../../../common/styles.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      width: 175,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        onPressed: () {},
        child: Text(
          AppLocalizations.of(context)!.visitButtonText,
          style: buttonMedium,
        ),
      ),
    );
  }
}

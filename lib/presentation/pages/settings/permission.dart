import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:bookque/presentation/widgets/settings/switch_button.dart';
import 'package:flutter/material.dart';

import '../../../common/localizations.dart';

class Permission extends StatelessWidget {
  const Permission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppLocalizations.of(context)!.accessPermissionText,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SwitchButton(
                    text: AppLocalizations.of(context)!.notificationText,
                  ),
                  SwitchButton(
                    text: AppLocalizations.of(context)!.storageText,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

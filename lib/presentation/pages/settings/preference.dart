import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:bookque/presentation/widgets/settings/setting_card_list.dart';
import 'package:flutter/material.dart';

class Preference  extends StatelessWidget {
  const Preference({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Tampilan',
      child: SingleChildScrollView(
        child: Column(
          children: [
            SettingCardList(
              text: 'Tema',
            ),
          ],
        ),
      ),
    );
  }
}

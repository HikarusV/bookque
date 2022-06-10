import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:bookque/presentation/widgets/settings/switch_button.dart';
import 'package:flutter/material.dart';

class Permission extends StatelessWidget {
  const Permission({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Izin Akses',
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  SwitchButton(
                    text: 'Notifikasi',
                  ),
                  SwitchButton(
                    text: 'Penyimpanan',
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

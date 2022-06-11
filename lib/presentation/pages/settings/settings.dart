import 'package:bookque/presentation/pages/settings/about_us.dart';
import 'package:bookque/presentation/pages/settings/account.dart';
import 'package:bookque/presentation/pages/settings/help.dart';
import 'package:bookque/presentation/pages/settings/permission.dart';
import 'package:bookque/presentation/pages/settings/preference.dart';
import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:bookque/presentation/widgets/settings/setting_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  // static const routeName = '/setting_page';

  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Pengaturan',
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SettingButton(
                text: 'Akun',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Account(),
                    ),
                  );
                },
              ),
              SettingButton(
                text: 'Tampilan',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Preference(),
                    ),
                  );
                },
              ),
              SettingButton(
                text: 'Izin Akses',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Permission(),
                    ),
                  );
                },
              ),
              SettingButton(
                text: 'Tentang Kami',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUs(),
                    ),
                  );
                },
              ),
              SettingButton(
                text: 'Bantuan',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Help(),
                    ),
                  );
                },
              ),
              SettingButton(
                text: 'Beri Rating',
                version: true,
                onPressed: () {},
              ),
              SettingButton(
                text: 'Keluar Akun',
                icon: Icons.logout,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

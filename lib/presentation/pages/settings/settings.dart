import 'package:bookque/presentation/pages/auth/setup_profile.dart';
import 'package:bookque/presentation/pages/settings/about_us.dart';
import 'package:bookque/presentation/pages/settings/help.dart';
import 'package:bookque/presentation/pages/settings/permission.dart';
import 'package:bookque/presentation/pages/settings/preference.dart';
import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:bookque/presentation/widgets/settings/setting_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/localizations.dart';

class Settings extends StatelessWidget {
  static const String routeName = 'SettingPage';

  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppLocalizations.of(context)!.settingsText,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SettingButton(
                text: AppLocalizations.of(context)!.accountText,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        // builder: (context) => Account(),
                        builder: (context) => const SetupProfile()),
                  );
                },
              ),
              SettingButton(
                text: AppLocalizations.of(context)!.appreanceText,
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
                text: AppLocalizations.of(context)!.accessPermissionText,
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
                text: AppLocalizations.of(context)!.aboutUsText,
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
                text: AppLocalizations.of(context)!.helpText,
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
                text: AppLocalizations.of(context)!.rateText,
                version: true,
                onPressed: () {},
              ),
              SettingButton(
                text: AppLocalizations.of(context)!.signOutText,
                icon: Icons.logout,
                onPressed: () async {
                  await context.read<AccountProv>().logOut();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

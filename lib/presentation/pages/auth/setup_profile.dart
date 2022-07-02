import 'package:bookque/common/localizations.dart';
import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../profilemaker/profile_maker.dart';

class SetupProfile extends StatelessWidget {
  const SetupProfile({Key? key, this.isRegist = false}) : super(key: key);
  final bool isRegist;

  @override
  Widget build(BuildContext context) {
    String displayName = context.read<AccountProv>().userData!.displayName ??
        globalLocalData.getString('name') ??
        'User';
    return isRegist
        ? Scaffold(
            body: profileMakerChild(context, displayName),
          )
        : CustomScaffold(
            title: AppLocalizations.of(context)!.accountText,
            child: profileMakerChild(context, displayName),
          );
  }

  Widget profileMakerChild(BuildContext context, String displayName) =>
      ProfileMaker(
        onFinish: () {
          if (!isRegist) {
            Navigator.pop(context);
          } else {
            context.read<AccountProv>().reloadState();
          }
        },
        oldUsername: displayName.substring(
            0, (displayName.length <= 13) ? displayName.length : 13),
        imageUrl: context.read<AccountProv>().userData!.photoURL ?? 'none',
        usingRequestNewImage: isRegist,
      );
}

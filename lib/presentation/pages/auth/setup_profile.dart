import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../main.dart';
import '../../provider/profile_maker_provider.dart';
import '../profilemaker/profile_maker.dart';

class SetupProfile extends StatelessWidget {
  const SetupProfile({Key? key, this.isRegist = false}) : super(key: key);
  final bool isRegist;

  @override
  Widget build(BuildContext context) {
    String displayName = context.read<AccountProv>().userData!.displayName ??
        globalLocalData.getString('name') ??
        'User';
    return ChangeNotifierProvider<ProfileMakerProvider>(
      create: (_) => ProfileMakerProvider(),
      child: ProfileMaker(
        onFinish: () {
          if (!isRegist) {
            Navigator.pop(context);
          } else {
            Navigator.popUntil(context, (route) => route.isFirst);
          }
        },
        oldUsername: displayName.substring(
            0, (displayName.length <= 13) ? displayName.length : 13),
        imageUrl: context.read<AccountProv>().userData!.photoURL ?? 'none',
        usingRequestNewImage: isRegist,
      ),
    );
  }
}

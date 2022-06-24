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
    return ChangeNotifierProvider<ProfileMakerProvider>(
      create: (_) => ProfileMakerProvider(),
      child: ProfileMaker(
        onFinish: () => Navigator.pop(context),
        oldUsername: context.read<AccountProv>().userData!.displayName ??
            globalLocalData.getString('name')!,
        imageUrl: context.read<AccountProv>().userData!.photoURL ?? 'none',
        usingRequestNewImage: isRegist,
      ),
    );
  }
}

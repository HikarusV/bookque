import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/styles.dart';
import '../../provider/internet_provider.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15, top: 7, bottom: 6),
          child: CircleAvatar(
            backgroundImage: (context.watch<InternetProvider>().isInternetError
                    ? const AssetImage('assets/logo.png')
                    : NetworkImage(context
                            .watch<AccountProv>()
                            .userData!
                            .photoURL ??
                        'https://graph.facebook.com/111968404870160/picture'))
                as ImageProvider,
            radius: 32,
            backgroundColor: Colors.transparent,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.watch<AccountProv>().userData!.displayName ?? 'User',
                style: titleMedium,
                maxLines: 2,
              ),
              Text(
                context.read<AccountProv>().userData!.email!,
                style: subTextGrey,
                maxLines: 1,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

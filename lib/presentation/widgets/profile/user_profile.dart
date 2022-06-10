import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../common/styles.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 15),
          child: CircleAvatar(
            backgroundImage: AssetImage(context
                    .read<AccountProv>()
                    .userData!
                    .photoURL ??
                'assets/profile.png'),
            radius: 40,
            backgroundColor: Colors.transparent,
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.read<AccountProv>().userData!.displayName ??
                    'Kosong broh',
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

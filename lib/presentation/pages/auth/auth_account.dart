import 'package:bookque/presentation/main_page.dart';
import 'package:bookque/presentation/pages/auth/setup_profile.dart';
import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class AuthAccount extends StatelessWidget {
  const AuthAccount({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          final dataAccount = context.watch<AccountProv>();
          dataAccount.getCurentUser();
          if (dataAccount.userData!.displayName == null ||
              dataAccount.userData!.photoURL == null) {
            return const SetupProfile(
              isRegist: true,
            );
          }

          return const MainPage();
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Ada yang error!!'),
          );
        } else {
          return Login();
        }
      },
    );
  }
}

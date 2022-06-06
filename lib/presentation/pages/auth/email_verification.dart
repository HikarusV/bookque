import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom2/home.dart';

class EmailVerification extends StatefulWidget {
  const EmailVerification({Key? key}) : super(key: key);

  @override
  State<EmailVerification> createState() => _EmailVerificationState();
}

class _EmailVerificationState extends State<EmailVerification> {
  bool isEmailVerified = false;
  Timer? timer;

  User userData = FirebaseAuth.instance.currentUser!;

  @override
  void initState() {
    super.initState();

    isEmailVerified = userData.emailVerified;

    if (!isEmailVerified) {
      sendVerifEmail();

      timer = Timer.periodic(
        const Duration(seconds: 4),
        (_) => checkEmailVerified(),
      );
    }
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  void sendVerifEmail() {}

  Future checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser!.reload();
    userData = FirebaseAuth.instance.currentUser!;
    setState(() {
      isEmailVerified = userData.emailVerified;
    });

    if (isEmailVerified) timer?.cancel();
  }

  @override
  Widget build(BuildContext context) => isEmailVerified
      ? const Home()
      : Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                Text('Please open link where send to your email')
              ],
            ),
          ),
        );
}

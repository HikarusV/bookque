import 'package:bookque/presentation/pages/auth/forget_password.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../widgets/auth/full_button.dart';
import '../../widgets/auth/heading_verification.dart';
import '../../widgets/auth/text_input.dart';

class CodeVerification extends StatefulWidget {
  const CodeVerification({Key? key}) : super(key: key);

  @override
  State<CodeVerification> createState() => _CodeVerificationState();
}

class _CodeVerificationState extends State<CodeVerification> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Lupa Kata Sandi',
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeadingVerification(
                title: 'Masukkan kode verifikasi',
                subTitle: 'Silahkan cek kode verifikasi di email kamu',
              ),
              Flexible(
                flex: 0,
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Column(
                    children: [
                      TextInput(
                        controller: TextEditingController(),
                        textHint: 'Kode',
                      ),
                      FullButton(
                        text: 'Verifikasi',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const ForgetPassword(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

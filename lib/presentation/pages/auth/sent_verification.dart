import 'package:bookque/presentation/pages/auth/code_verification.dart';
import 'package:bookque/presentation/widgets/auth/heading_verification.dart';
import 'package:bookque/presentation/widgets/custom/full_button.dart';
import 'package:bookque/presentation/widgets/custom/text_input.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class SentVerification extends StatefulWidget {
  const SentVerification({Key? key}) : super(key: key);

  @override
  State<SentVerification> createState() => _SentVerificationState();
}

class _SentVerificationState extends State<SentVerification> {
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
                title: 'Masukkan email untuk melanjutkan',
                subTitle: 'Kami akan mengirim kode verifikasi ke email kamu',
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
                        textHint: 'Masukkan Alamat Email',
                      ),
                      FullButton(
                        text: 'Kirim Kode Verifikasi',
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CodeVerification(),
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

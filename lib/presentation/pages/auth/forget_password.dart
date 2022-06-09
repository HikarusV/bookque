import 'package:bookque/presentation/pages/auth/login.dart';
import 'package:bookque/presentation/widgets/custom/full_button.dart';
import 'package:bookque/presentation/widgets/custom/password_field.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Lupa Kata Sandi',
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                flex: 0,
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Column(
                    children: [
                      PasswordField(
                        controller: TextEditingController(),
                        title: 'Kata Sandi Baru',
                        textHint: 'Masukkan Kata Sandi Baru',
                      ),
                      PasswordField(
                        controller: TextEditingController(),
                        title: 'Konfirmasi Kata Sandi Baru',
                        textHint: 'Masukkan Kata Sandi Baru',
                      ),
                      FullButton(
                        text: 'Simpan',
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
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

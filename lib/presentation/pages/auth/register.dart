import 'package:bookque/data/cache/cache_auth.dart';
import 'package:bookque/data/datasource/api_handler/api_helper.dart';
import 'package:bookque/presentation/pages/auth/auth_account.dart';
import 'package:bookque/presentation/pages/auth/code_validation.dart';
import 'package:bookque/presentation/widgets/scroll_behavior_without_glow.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom/bottom_text_button.dart';
import '../../widgets/custom/full_button.dart';
import '../../widgets/custom/heading_title.dart';
import '../../widgets/custom/password_field.dart';
import '../../widgets/custom/text_input.dart';
import 'login.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();
  final Reference reference = Reference(data: '');
  final password = StrengthPassword();

  @override
  Widget build(BuildContext context) {
    password.reference = reference;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: ScrollBehaviorWithoutGlow(),
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 15),
                  const HeadingTitle(),
                  const SizedBox(height: 15),
                  TextInput(
                    controller: nameController,
                    text: 'Nama Lengkap',
                    title: 'Nama',
                  ),
                  TextInput(
                    controller: mailController,
                    text: 'emailcontoh@mail.com',
                    title: 'Alamat Email',
                  ),
                  PasswordField(
                    controller: passController,
                    title: 'Kata Sandi',
                    passConfirmation: password,
                  ),
                  PasswordField(
                    controller: confirmPassController,
                    title: 'Konfirmasi Kata Sandi',
                    text: 'Masukan Kembali Kata Sandi',
                    passConfirmation: SamePassword(reference: reference),
                  ),
                  FullButton(
                    onPressed: () async {
                      String email = mailController.text;
                      String name = nameController.text;
                      String pass = passController.text;
                      String confirmPass = confirmPassController.text;
                      if (email != '' ||
                          name != '' ||
                          pass != '' ||
                          confirmPass != '') {
                        if (reference.data == confirmPass) {
                          AuthCache.data['pass'] = pass;
                          AuthCache.data['name'] = name;
                          AuthCache.data['mail'] = email;
                        }

                        try {
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) => const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );

                          Map result =
                              await HandleApi.postEmailVerification(email);
                          if (!result['error']) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => CodeValidation(
                                  controller: TextEditingController(),
                                  whenValid: () async {
                                    // Navigator.pop(context);
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const AuthAccount(),
                                      ),
                                    );
                                  },
                                  whenError: () => print('Gagal broh'),
                                ),
                              ),
                            );
                          } else {
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Ada yang salah'),
                                duration: Duration(seconds: 4),
                              ),
                            );
                          }
                        } catch (e) {
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(e.toString()),
                              duration: const Duration(seconds: 4),
                            ),
                          );
                        }
                      } else {
                        mailController.text = AuthCache.data['mail'];
                        nameController.text = AuthCache.data['name'];
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Semua kolom harus diisi'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    },
                    text: 'Daftar',
                  ),
                  BottomTextButton(
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Login(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

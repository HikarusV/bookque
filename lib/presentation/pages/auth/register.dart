import 'package:bookque/data/cache/cache_auth.dart';
import 'package:bookque/data/datasource/api_handler/api_helper.dart';
import 'package:bookque/presentation/pages/auth/auth_account.dart';
import 'package:bookque/presentation/pages/auth/code_validation.dart';
import 'package:bookque/presentation/widgets/error/snackbar_error.dart';
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
                  const HeadingTitle(
                    title: 'Daftar',
                    subTitle: 'Daftar untuk memiliki akun',
                  ),
                  const SizedBox(height: 15),
                  TextInput(
                    controller: nameController,
                    textHint: 'Masukkan Nama Lengkap',
                    title: 'Nama',
                  ),
                  TextInput(
                    controller: mailController,
                    textHint: 'Masukkan Alamat Email',
                    title: 'Email',
                  ),
                  PasswordField(
                    controller: passController,
                    title: 'Kata Sandi',
                    passConfirmation: password,
                  ),
                  PasswordField(
                    controller: confirmPassController,
                    title: 'Konfirmasi Kata Sandi',
                    textHint: 'Masukan Kembali Kata Sandi',
                    passConfirmation: SamePassword(reference: reference),
                  ),
                  FullButton(
                    onPressed: () async {

                      String email = mailController.text;
                      String name = nameController.text;
                      String pass = passController.text;
                      String confirmPass = confirmPassController.text;

                      Map condition = columnCheck(email, name, pass, confirmPass);

                      print(condition);

                      if (condition['isAccept']) {
                        AuthCache.data['pass'] = pass;
                        AuthCache.data['name'] = name;
                        AuthCache.data['mail'] = email;

                        await registerFunction(context);
                      } else {
                        snackbarError(
                          context,
                          duration: 5,
                          message: condition['message'],
                        );
                      }

                      // if (email.isNotEmpty &&
                      //     name.isNotEmpty &&
                      //     pass.length > 6 &&
                      //     confirmPass.isNotEmpty) {
                      //   if (reference.data == confirmPass) {
                      //     AuthCache.data['pass'] = pass;
                      //     AuthCache.data['name'] = name;
                      //     AuthCache.data['mail'] = email;
                      //
                      //     await registerFunction(context);
                      //   } else {
                      //     snackbarError(
                      //       context,
                      //       duration: 5,
                      //       message:
                      //           'Kolom password dan kolom konfirmasi password harus sama',
                      //     );
                      //   }
                      // } else {
                      //   mailController.text = AuthCache.data['mail'];
                      //   nameController.text = AuthCache.data['name'];
                      //   snackbarError(
                      //     context,
                      //     duration: 2,
                      //     message:
                      //     'Semua kolom harus diisi',
                      //   );
                      // }
                    },
                    text: 'Daftar',
                  ),
                  BottomTextButton(
                    text: 'Sudah memiliki akun? ',
                    textButton: 'Masuk',
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

  Map columnCheck(String email, String name, String pass, String confirmPass) {
    if (email.isEmpty || name.isEmpty || pass.isEmpty || confirmPass.isEmpty) {
      return {
        'isAccept' : false,
    'message' : 'Semua kolom harus diisi',
      };
    }

    if (pass.length < 6) {
      return {
        'isAccept' : false,
        'message' : 'Password tidak boleh kurang dari 6',
      };
    }

    if (reference.data != confirmPass) {
      return {
        'isAccept' : false,
        'message' : 'Kolom password dan kolom konfirmasi password harus sama',
      };
    }

    return {
      'isAccept' : true,
      'message' : 'Success',
    };
  }

  Future registerFunction(BuildContext context) async {
    try {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      Map result =
          await HandleApi.postEmailVerification(AuthCache.data['mail']);
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
                    builder: (context) => const AuthAccount(),
                  ),
                );
              },
              whenError: () => print('Gagal broh'),
            ),
          ),
        );
        snackbarError(
          context,
          duration: 4,
          message:
          'sukses',
        );
      } else {
        Navigator.pop(context);
        snackbarError(
          context,
          duration: 4,
          message:
          'Ada yang salah',
        );
      }
    } catch (e) {
      print('disini');
      Navigator.pop(context);
      snackbarError(
        context,
        duration: 4,
        message:
        e.toString(),
      );
    }
  }
}

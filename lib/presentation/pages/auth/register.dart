import 'package:bookque/data/cache/cache_auth.dart';
import 'package:bookque/data/datasource/api_handler/api_helper.dart';
import 'package:bookque/presentation/pages/auth/code_validation.dart';
import 'package:bookque/presentation/widgets/error/snackbar_error.dart';
import 'package:bookque/presentation/widgets/scroll_behavior_without_glow.dart';
import 'package:flutter/material.dart';

import '../../../common/localizations.dart';
import '../../widgets/auth/bottom_text_button.dart';
import '../../widgets/auth/full_button.dart';
import '../../widgets/auth/heading_title.dart';
import '../../widgets/auth/password_field.dart';
import '../../widgets/auth/text_input.dart';
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
                  HeadingTitle(
                    title: AppLocalizations.of(context)!.registerText1,
                    subTitle: AppLocalizations.of(context)!.registerText2,
                  ),
                  const SizedBox(height: 15),
                  TextInput(
                    controller: nameController,
                    textHint: AppLocalizations.of(context)!.namePlaceholderText,
                    title: AppLocalizations.of(context)!.nameLabelText,
                  ),
                  TextInput(
                    controller: mailController,
                    textHint:
                        AppLocalizations.of(context)!.emailPlaceholderText,
                    title: AppLocalizations.of(context)!.emailLabelText,
                  ),
                  PasswordField(
                    controller: passController,
                    title: AppLocalizations.of(context)!.passwordLabelText,
                    textHint:
                        AppLocalizations.of(context)!.passwordPlaceholderText,
                    passConfirmation: password,
                  ),
                  PasswordField(
                    controller: confirmPassController,
                    title:
                        AppLocalizations.of(context)!.confirmPasswordLabelText,
                    textHint: AppLocalizations.of(context)!
                        .confirmPasswordPlaceholderText,
                    passConfirmation: SamePassword(reference: reference),
                  ),
                  FullButton(
                    onPressed: () async {
                      String email = mailController.text;
                      String name = nameController.text;
                      String pass = passController.text;
                      String confirmPass = confirmPassController.text;

                      Map condition =
                          columnCheck(context, email, name, pass, confirmPass);

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
                    text: AppLocalizations.of(context)!.registerText1,
                  ),
                  BottomTextButton(
                    text: AppLocalizations.of(context)!.haveAccountText,
                    textButton: AppLocalizations.of(context)!.loginText1,
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

  Map columnCheck(BuildContext context, String email, String name, String pass,
      String confirmPass) {
    if (email.isEmpty || name.isEmpty || pass.isEmpty || confirmPass.isEmpty) {
      return {
        'isAccept': false,
        'message': AppLocalizations.of(context)!.requiredFieldText
      };
    }

    if (pass.length < 6) {
      return {
        'isAccept': false,
        'message': AppLocalizations.of(context)!.minPasswordText,
      };
    }

    if (reference.data != confirmPass) {
      return {
        'isAccept': false,
        'message': AppLocalizations.of(context)!.sameConfirmPasswordText,
      };
    }

    return {
      'isAccept': true,
      'message': 'Success',
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
        Navigator.pop(context);
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => CodeValidation(
              controller: TextEditingController(),
              whenValid: () async {
                Navigator.pop(context);
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => const AuthAccount(),
                //   ),
                // );
              },
              whenError: () => print('Gagal broh'),
            ),
          ),
        );
        snackbarError(
          context,
          duration: 4,
          message: 'sukses',
        );
      } else {
        Navigator.pop(context);
        snackbarError(
          context,
          duration: 4,
          message: 'Ada yang salah',
        );
      }
    } catch (e) {
      print('disini');
      Navigator.pop(context);
      snackbarError(
        context,
        duration: 4,
        message: e.toString(),
      );
    }
  }
}

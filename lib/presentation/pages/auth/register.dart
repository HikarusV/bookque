import 'package:bookque/presentation/pages/auth/code_validation.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom/bottom_text_button.dart';
import '../../widgets/custom/full_button.dart';
import '../../widgets/custom/heading_title.dart';
import '../../widgets/custom/password_field.dart';
import '../../widgets/custom/text_input.dart';

import '../../../common/styles.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final TextEditingController passController = TextEditingController();
  final Reference reference = Reference(data: '');
  final password = StrengthPassword();

  @override
  Widget build(BuildContext context) {
    password.reference = reference;
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              const SizedBox(height: 15),
              const HeadingTitle(),
              TextInput(
                controller: TextEditingController(),
                text: 'Nama Lengkap',
                title: 'Nama',
              ),
              TextInput(
                controller: TextEditingController(),
                text: 'examplemail@mail.com',
                title: 'E-mail',
              ),
              // TextInput(
              //   controller: TextEditingController(),
              //   text: 'Password',
              //   title: 'Password',
              // ),
              PasswordField(
                controller: passController,
                title: 'Password',
                passConfirmation: password,
              ),
              PasswordField(
                controller: TextEditingController(),
                title: 'Konfirmasi Password',
                text: 'type password again',
                passConfirmation: SamePassword(reference: reference),
              ),
              FullButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => CodeValidation(
                        controller: TextEditingController(),
                        whenValid: () => print('Selesai broh'),
                        whenError: () => print('Gagal broh'),
                      ),
                    ),
                  );
                },
                text: 'Daftar',
              ),
              BottomTextButton(
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

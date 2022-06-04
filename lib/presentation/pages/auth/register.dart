import 'package:flutter/material.dart';
import '../../widgets/custom/bottom_text_button.dart';
import '../../widgets/custom/full_button.dart';
import '../../widgets/custom/heading_title.dart';
import '../../widgets/custom/password_field.dart';
import '../../widgets/custom/text_input.dart';

import '../../../common/styles.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
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
              ),
              TextInput(
                controller: TextEditingController(),
              ),
              TextInput(
                controller: TextEditingController(),
              ),
              PasswordField(
                controller: TextEditingController(),
              ),
              PasswordField(
                controller: TextEditingController(),
              ),
              FullButton(onPressed: () => ''),
              const BottomTextButton(),
            ],
          ),
        ),
      ),
    );
  }
}

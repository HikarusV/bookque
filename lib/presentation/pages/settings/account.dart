import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:bookque/presentation/widgets/scroll_behavior_without_glow.dart';
import 'package:bookque/presentation/widgets/settings/profile_picture.dart';
import 'package:flutter/material.dart';

import '../../../common/localizations.dart';
import '../../widgets/auth/full_button.dart';
import '../../widgets/auth/password_field.dart';
import '../../widgets/auth/text_input.dart';

class Account extends StatelessWidget {
  Account({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  final TextEditingController confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppLocalizations.of(context)!.accountText,
      child: ScrollConfiguration(
        behavior: ScrollBehaviorWithoutGlow(),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                const ProfilePicturePicker(
                  urlNetwork:
                      'https://graph.facebook.com/111968404870160/picture',
                ),
                TextInput(
                  controller: nameController,
                  textHint: AppLocalizations.of(context)!.namePlaceholderText,
                  title: AppLocalizations.of(context)!.nameLabelText,
                ),
                TextInput(
                  controller: emailController,
                  textHint: AppLocalizations.of(context)!.emailPlaceholderText,
                  title: AppLocalizations.of(context)!.emailLabelText,
                ),
                PasswordField(
                  controller: passController,
                  textHint:
                      AppLocalizations.of(context)!.passwordPlaceholderText,
                  title: AppLocalizations.of(context)!.passwordLabelText,
                ),
                PasswordField(
                  controller: confirmPassController,
                  textHint:
                      AppLocalizations.of(context)!.passwordPlaceholderText,
                  title: AppLocalizations.of(context)!.confirmPasswordLabelText,
                ),
                FullButton(
                  text: AppLocalizations.of(context)!.saveText,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Mohon maaf"),
                        content: const Text(
                            "Saat ini fitur update profile belum tersedia"),
                        actions: [
                          TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('ok')),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

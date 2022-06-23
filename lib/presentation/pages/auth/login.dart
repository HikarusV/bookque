import 'package:bookque/presentation/pages/auth/register.dart';
import 'package:bookque/presentation/pages/auth/sent_verification.dart';
import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:bookque/presentation/widgets/scroll_behavior_without_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/localizations.dart';
import '../../../common/styles.dart';
import '../../widgets/auth/bottom_text_button.dart';
import '../../widgets/auth/full_button.dart';
import '../../widgets/auth/heading_title.dart';
import '../../widgets/auth/image_button.dart';
import '../../widgets/auth/password_field.dart';
import '../../widgets/auth/text_input.dart';

class Login extends StatelessWidget {
  static const String routeName = 'loginPage';

  Login({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: ScrollBehaviorWithoutGlow(),
          child: SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height - 180,
              margin: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      HeadingTitle(
                        title: AppLocalizations.of(context)!.loginText1,
                        subTitle: AppLocalizations.of(context)!.loginText2,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15, top: 20, bottom: 10),
                        child: Container(
                          height: 100,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/logo.png'),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          TextInput(
                            controller: emailController,
                            title: AppLocalizations.of(context)!.emailLabelText,
                            textHint: AppLocalizations.of(context)!
                                .emailPlaceholderText,
                          ),
                          PasswordField(
                            controller: passController,
                            title:
                                AppLocalizations.of(context)!.passwordLabelText,
                            textHint: AppLocalizations.of(context)!
                                .passwordPlaceholderText,
                            passConfirmation: NoneConfirmation(),
                          ),
                          FullButton(
                            onPressed: () async {
                              await context
                                  .read<AccountProv>()
                                  .signInMailPass(
                                      emailController.text, passController.text)
                                  .onError((error, stackTrace) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      error.toString(),
                                    ),
                                    duration: const Duration(seconds: 4),
                                  ),
                                );
                              });
                            },
                            text: AppLocalizations.of(context)!.loginText1,
                            marginBottom: 5,
                          ),
                          BottomTextButton(
                            textButton: AppLocalizations.of(context)!
                                .askForgotPasswordText,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SentVerification(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        AppLocalizations.of(context)!.loginOptionText,
                        style: titleSmall,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ImageButton(
                            image: const AssetImage(
                              'assets/facebook.png',
                            ),
                            onPressed: () async {
                              await context
                                  .read<AccountProv>()
                                  .signInFacebook()
                                  .onError((error, stackTrace) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      error.toString(),
                                    ),
                                    duration: const Duration(seconds: 4),
                                  ),
                                );
                                print('disini error : $error');
                              });
                            },
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          ImageButton(
                            image: const AssetImage(
                              'assets/google.png',
                            ),
                            onPressed: () async {
                              await context
                                  .read<AccountProv>()
                                  .signInGoogle()
                                  .onError((error, stackTrace) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      error.toString(),
                                    ),
                                    duration: const Duration(seconds: 4),
                                  ),
                                );
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                  BottomTextButton(
                    text: AppLocalizations.of(context)!.dontHaveAccountText,
                    textButton: AppLocalizations.of(context)!.registerText1,
                    onTap: () =>
                        Navigator.of(context).pushNamed(Register.routeName),
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

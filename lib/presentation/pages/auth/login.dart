import 'package:bookque/presentation/pages/auth/register.dart';
import 'package:bookque/presentation/pages/auth/sent_verification.dart';
import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:bookque/presentation/widgets/scroll_behavior_without_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/styles.dart';
import '../../widgets/custom/bottom_text_button.dart';
import '../../widgets/custom/full_button.dart';
import '../../widgets/custom/heading_title.dart';
import '../../widgets/custom/image_button.dart';
import '../../widgets/custom/password_field.dart';
import '../../widgets/custom/text_input.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                      const HeadingTitle(
                        title: 'Masuk',
                        subTitle: 'Masuk untuk melanjutkan',
                      ),
                      Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            height: 100,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('assets/bookque_icon.png'))),
                          )
                          // SizedBox(
                          //   height: 140,
                          //   width: 257,
                          //   child: FittedBox(
                          //     child: Image.asset('assets/bookque_icon.png'),
                          //     fit: BoxFit.contain,
                          //   ),
                          // ),
                          ),
                      Column(
                        children: [
                          TextInput(
                            controller: emailController,
                            title: 'Email',
                            textHint: 'Masukkan Alamat Email',
                          ),
                          PasswordField(
                            controller: passController,
                            passConfirmation: NoneConfirmation(),
                          ),
                          FullButton(
                            onPressed: () async {
                              await context
                                  .read<AccountProv>()
                                  .signInMailPass(emailController.text, passController.text)
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
                            text: 'Masuk',
                            marginBottom: 5,
                          ),
                          BottomTextButton(
                            textButton: 'Lupa Kata Sandi?',
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SentVerification(),
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
                        'Atau masuk menggunakan',
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
                    text: 'Belum memiliki akun? ',
                    textButton: 'Daftar',
                    onTap: () => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Register(),
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

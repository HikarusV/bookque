import 'package:bookque/presentation/main_page.dart';
import 'package:bookque/presentation/pages/auth/register.dart';
import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../widgets/custom/bottom_text_button.dart';
import '../../widgets/custom/full_button.dart';
import '../../widgets/custom/heading_title.dart';
import '../../widgets/custom/image_button.dart';
import '../../widgets/custom/password_field.dart';
import '../../../common/styles.dart';
import '../../widgets/custom/text_input.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final TextEditingController email = TextEditingController();
  final TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          // height: MediaQuery.of(context).size.height - 180,
          margin: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  const Flexible(
                    flex: 0,
                    child: HeadingTitle(),
                  ),
                  Flexible(
                    flex: 0,
                    child: Padding(
                        padding: const EdgeInsets.all(25),
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
                  ),
                  Flexible(
                    flex: 0,
                    child: Column(
                      children: [
                        TextInput(
                          controller: email,
                          text: 'examplemail@mail.com',
                          title: 'E-mail',
                        ),
                        PasswordField(
                          controller: pass,
                          passConfirmation: NoneConfirmation(),
                        ),
                        FullButton(
                          onPressed: () async {
                            await context
                                .read<AccountProv>()
                                .signInMailPass(email.text, pass.text)
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Flexible(
                flex: 0,
                child: Column(
                  children: [
                    Text(
                      'Atau masuk menggunakan',
                      style: descText,
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
              ),
              Flexible(
                child: BottomTextButton(
                  onTap: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Register(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

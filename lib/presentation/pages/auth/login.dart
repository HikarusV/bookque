import 'package:flutter/material.dart';
import '../../widgets/custom/bottom_text_button.dart';
import '../../widgets/custom/full_button.dart';
import '../../widgets/custom/heading_title.dart';
import '../../widgets/custom/image_button.dart';
import '../../widgets/custom/password_field.dart';
import '../../../common/styles.dart';
import '../../widgets/custom/text_input.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    child: SizedBox(
                      height: 140,
                      width: 257,
                      child: FittedBox(
                        child: Image.asset('assets/bookque_icon.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 0,
                    child: Column(
                      children: [
                        TextInput(
                          controller: TextEditingController(),
                        ),
                        PasswordField(controller: TextEditingController()),
                        FullButton(
                          onPressed: () => '',
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
                          onPressed: () => '',
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        ImageButton(
                          image: const AssetImage(
                            'assets/google.png',
                          ),
                          onPressed: () => '',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Flexible(
                child: BottomTextButton(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:bookque/presentation/pages/auth/code_verification.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';

import '../../../common/localizations.dart';
import '../../widgets/auth/full_button.dart';
import '../../widgets/auth/heading_verification.dart';
import '../../widgets/auth/text_input.dart';

class SentVerification extends StatefulWidget {
  const SentVerification({Key? key}) : super(key: key);

  @override
  State<SentVerification> createState() => _SentVerificationState();
}

class _SentVerificationState extends State<SentVerification> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppLocalizations.of(context)!.forgotPasswordText1,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingVerification(
                title: AppLocalizations.of(context)!.forgotPasswordText2,
                subTitle: AppLocalizations.of(context)!.forgotPasswordText3,
              ),
              Flexible(
                flex: 0,
                child: Container(
                  margin:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                  child: Column(
                    children: [
                      TextInput(
                        controller: TextEditingController(),
                        textHint:
                            AppLocalizations.of(context)!.emailPlaceholderText,
                      ),
                      FullButton(
                        text: AppLocalizations.of(context)!.sendCodeButtonText,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const CodeVerification(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

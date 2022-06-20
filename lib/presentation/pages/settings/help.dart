import 'package:bookque/common/styles.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

import '../../../common/localizations.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppLocalizations.of(context)!.helpText,
      child: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(15.0),
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: primaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(AppLocalizations.of(context)!.contactUsText,
                    style: titleSemiMedium),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/wildan_profile.jpeg'),
                      ),
                      Text('Muhammad Wildhan K', style: subText),
                      Link(
                        target: LinkTarget.blank,
                        uri:
                            Uri.parse('https://www.linkedin.com/in/mwildhank/'),
                        builder: (context, followLink) => InkWell(
                          onTap: followLink,
                          child: Image.asset(
                            'assets/linkedin_logo.png',
                            width: 80,
                            height: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/farras_profile.jpeg'),
                      ),
                      Text('Abdurrachman Farras', style: subText),
                      Link(
                        target: LinkTarget.blank,
                        uri: Uri.parse(
                            'https://www.linkedin.com/in/abdurrachman-farras-8a8a08222/'),
                        builder: (context, followLink) => InkWell(
                          onTap: followLink,
                          child: Image.asset(
                            'assets/linkedin_logo.png',
                            width: 80,
                            height: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/sapta_profile.jpeg'),
                      ),
                      Text('Nazwa Sapta Pradana', style: subText),
                      Link(
                        target: LinkTarget.blank,
                        uri: Uri.parse(
                            'https://www.linkedin.com/in/saptapradana/'),
                        builder: (context, followLink) => InkWell(
                          onTap: followLink,
                          child: Image.asset(
                            'assets/linkedin_logo.png',
                            width: 80,
                            height: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      const CircleAvatar(
                        radius: 50,
                        backgroundImage:
                            AssetImage('assets/yudhis_profile.jpeg'),
                      ),
                      Text('Yudhistira Hary P', style: subText),
                      Link(
                        target: LinkTarget.blank,
                        uri: Uri.parse(
                            'https://www.linkedin.com/in/yudhistira-hary-pratama/'),
                        builder: (context, followLink) => InkWell(
                          onTap: followLink,
                          child: Image.asset(
                            'assets/linkedin_logo.png',
                            width: 80,
                            height: 25,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

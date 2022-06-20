import 'package:bookque/common/styles.dart';
import 'package:bookque/presentation/pages/auth/auth_account.dart';
import 'package:bookque/presentation/provider/database_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../common/localizations.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<DatabaseProvider>().selectData();
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(bottom: 80),
        child: PageView(
          controller: controller,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            Container(
              color: const Color(0xffCCE5FF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/onboarding1.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Text('Search Favorite', style: onboardingTitle),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(AppLocalizations.of(context)!.onboardingText1,
                      textAlign: TextAlign.center, style: onboardingText),
                ],
              ),
            ),
            Container(
              color: const Color(0xffCCE5FF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/onboarding2.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Text('Enjoy Reading', style: onboardingTitle),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(AppLocalizations.of(context)!.onboardingText2,
                      textAlign: TextAlign.center, style: onboardingText),
                ],
              ),
            ),
            Container(
              color: const Color(0xffCCE5FF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/onboarding3.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                  Text('Easy Life', style: onboardingTitle),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(AppLocalizations.of(context)!.onboardingText3,
                      textAlign: TextAlign.center, style: onboardingText),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: () async {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const AuthAccount(),
                  ),
                );
              },
              child: isLastPage
                  ? const Text('')
                  : Text(
                      AppLocalizations.of(context)!.onboardingSkipText,
                      style: subText,
                    ),
            ),
            Center(
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: WormEffect(
                  spacing: 16,
                  dotColor: Colors.lightBlue.shade100,
                  activeDotColor: Colors.blue.shade500,
                ),
                onDotClicked: (index) => controller.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                ),
              ),
            ),
            isLastPage
                ? TextButton(
                    onPressed: () async {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => const AuthAccount(),
                        ),
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context)!.onboardingStartText,
                      style: subText,
                    ),
                  )
                : TextButton(
                    onPressed: () => controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.onboardingNextText,
                      style: subText,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

import 'package:bookque/common/localizations.dart';
import 'package:bookque/common/styles.dart';
import 'package:bookque/presentation/pages/splashscreen.dart';
import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:bookque/presentation/provider/localizations_provider.dart';
import 'package:bookque/presentation/provider/settings_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AccountProv>(
          create: (context) => AccountProv(),
        ),
        ChangeNotifierProvider<LocalizationProvider>(
          create: (context) => LocalizationProvider(),
        ),
        ChangeNotifierProvider<SettingsProvider>(
          create: (context) => SettingsProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.watch<LocalizationProvider>().locale,
      title: 'BookQue',
      // theme: ThemeData(
      //   colorScheme: Theme.of(context).colorScheme.copyWith(
      //         primary: primaryColor,
      //         onPrimary: Colors.white,
      //         secondary: secondaryColor,
      //       ),
      // ),
      // themeMode: context.watch<SettingsProvider>().myAppsTheme,
      theme: ThemeData(
          colorScheme: context.watch<SettingsProvider>().darkTheme
              ? darkColorScheme
              : lightColorScheme),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        '/': (context) => const SplashScreen(),
      },
    );
  }
}

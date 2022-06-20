import 'package:bookque/common/localizations.dart';
import 'package:bookque/common/styles.dart';
import 'package:bookque/data/db/database_helper.dart';
import 'package:bookque/presentation/onboarding_page.dart';
import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:bookque/presentation/provider/categories_provider.dart';
import 'package:bookque/presentation/provider/database_provider.dart';
import 'package:bookque/presentation/provider/detail_items_provider.dart';
import 'package:bookque/presentation/provider/home_provider.dart';
import 'package:bookque/presentation/provider/localizations_provider.dart';
import 'package:bookque/presentation/provider/profile_items_provider.dart';
import 'package:bookque/presentation/provider/search_provider.dart';
import 'package:bookque/presentation/provider/settings_provider.dart';
import 'package:bookque/presentation/provider/upload_provider.dart';
import 'package:bookque/presentation/provider/user_item_detail.dart';
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
        ChangeNotifierProvider<HomeProvider>(
          create: (context) => HomeProvider(),
        ),
        ChangeNotifierProvider<SearchProvider>(
          create: (context) => SearchProvider(),
        ),
        ChangeNotifierProvider<CategoriesProvider>(
          create: (context) => CategoriesProvider(),
        ),
        ChangeNotifierProvider<DetailItemsProvider>(
          create: (context) => DetailItemsProvider(),
        ),
        ChangeNotifierProvider<UploadUpdateItemProvider>(
          create: (context) => UploadUpdateItemProvider(),
        ),
        ChangeNotifierProvider<ProfileItemsProvider>(
          create: (context) => ProfileItemsProvider(),
        ),
        ChangeNotifierProvider<UserDetailItemsProvider>(
          create: (context) => UserDetailItemsProvider(),
        ),
        ChangeNotifierProvider<DatabaseProvider>(
          create: (context) =>
              DatabaseProvider(databaseHelper: DatabaseHelper()),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: context.watch<LocalizationProvider>().locale,
      title: 'BookQue',
      theme: ThemeData(
          colorScheme: context.watch<SettingsProvider>().darkTheme
              ? darkColorScheme
              : lightColorScheme),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routes: {
        '/': (context) => const OnboardingPage(),
      },
    );
  }
}

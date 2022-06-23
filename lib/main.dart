import 'package:bookque/common/localizations.dart';
import 'package:bookque/common/styles.dart';
import 'package:bookque/data/models/full_items.dart';
import 'package:bookque/presentation/onboarding_page.dart';
import 'package:bookque/presentation/pages/auth/auth_account.dart';
import 'package:bookque/presentation/pages/auth/login.dart';
import 'package:bookque/presentation/pages/auth/register.dart';
import 'package:bookque/presentation/pages/category/all_categories_list.dart';
import 'package:bookque/presentation/pages/detail/user_detail.dart';
import 'package:bookque/presentation/pages/search/search.dart';
import 'package:bookque/presentation/pages/settings/settings.dart';
import 'package:bookque/presentation/pages/upload/upload.dart';
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
import 'package:bookque/presentation/widgets/detail/detail_data_prov_pages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'common/utils/system_notification.dart';
import 'firebase_options.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  print('Handling a background message ${message.messageId}');
}

late AndroidNotificationChannel channel;
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
late SharedPreferences globalLocalData;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  globalLocalData = await SharedPreferences.getInstance();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await firebaseSetup();
  await NotificationSystem.init(
    initNotifPlugin: flutterLocalNotificationsPlugin,
    androidChannel: channel,
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
          create: (context) => DatabaseProvider(),
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
      builder: (context, child) {
        return MediaQuery(
          child: child!,
          data: MediaQuery.of(context).copyWith(
              textScaleFactor: context.read<SettingsProvider>().fontScaleValue),
        );
      },
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
        '/': (context) => (globalLocalData.getBool('first') == null ||
                globalLocalData.getBool('first') == false)
            ? const OnboardingPage()
            : const AuthAccount(),
        Login.routeName: (context) => Login(),
        Register.routeName: (context) => Register(),
        DetailDataProvPages.routeName: (context) => DetailDataProvPages(
              item: ModalRoute.of(context)?.settings.arguments as FullItems,
              withRecommendation:
                  ModalRoute.of(context)?.settings.arguments as bool,
              tagPrefix: ModalRoute.of(context)?.settings.arguments as String,
            ),
        Settings.routeName: (context) => const Settings(),
        Search.routeName: (context) => const Search(),
        UserDetail.routeName: (context) => UserDetail(
            id: ModalRoute.of(context)?.settings.arguments as String,
            index: ModalRoute.of(context)?.settings.arguments as int),
        Upload.routeName: (context) => const Upload(),
        AllCategoriesItems.routeName: (context) => const AllCategoriesItems(),
      },
    );
  }
}

Future firebaseSetup() async {
  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_channel',
      'High Importance Notification',
      description: 'Description Notification',
      importance: Importance.high,
      playSound: true,
      showBadge: true,
    );

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
  }
}

import 'package:bookque/presentation/main_page.dart';
import 'package:bookque/presentation/pages/auth/login.dart';
import 'package:bookque/presentation/pages/custom2/home.dart';
import 'package:bookque/presentation/pages/search/search_page.dart';
import 'package:bookque/presentation/pages/upload/upload.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => const MainPage(),
      },
    );
  }
}
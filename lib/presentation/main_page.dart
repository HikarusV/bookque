import 'package:flutter/material.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../common/styles.dart';
import 'pages/bookmark/bookmark.dart';
import 'pages/home/home.dart';
import 'pages/profile/profile.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    const Home(),
    const Bookmark(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LazyLoadIndexedStack(
        index: currentIndex,
        children: screens,
      ),
      backgroundColor: const Color(0xffFCFCFF),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SalomonBottomBar(
            currentIndex: currentIndex,
            onTap: (index) {
              setState(() => currentIndex = index);
            },
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: const Text("Home"),
                selectedColor: primaryColor,
                unselectedColor: Colors.grey,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.bookmark),
                title: const Text("Bookmark"),
                selectedColor: primaryColor,
                unselectedColor: Colors.grey,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.person),
                title: const Text("Profile"),
                selectedColor: primaryColor,
                unselectedColor: Colors.grey,
              ),
            ]),
      ),
    );
  }
}

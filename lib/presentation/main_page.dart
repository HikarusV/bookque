import 'package:bookque/presentation/pages/newspaper/newspaper.dart';
import 'package:bookque/presentation/widgets/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:lazy_load_indexed_stack/lazy_load_indexed_stack.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

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
    // const NewsPaper(),
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
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 9, right: 9),
        child:
            //     BottomNavigationBar(
            //   type: BottomNavigationBarType.fixed,
            //   backgroundColor: Theme.of(context).colorScheme.onPrimary,
            //   selectedItemColor: Theme.of(context).colorScheme.primary,
            //   unselectedItemColor: Theme.of(context).colorScheme.onSurfaceVariant,
            //   showUnselectedLabels: false,
            //   currentIndex: currentIndex,
            //   onTap: (index) {
            //     setState(() => currentIndex = index);
            //   },
            //   items: const [
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.home),
            //       label: 'Home',
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.newspaper),
            //       label: "NewsPaper",
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.compass_calibration),
            //       label: "Explore",
            //     ),
            //     BottomNavigationBarItem(
            //       icon: Icon(Icons.person),
            //       label: "Profile",
            //     ),
            //   ],
            // )

            SalomonBottomBar(
          currentIndex: currentIndex,
          onTap: (index) {
            setState(() => currentIndex = index);
          },
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Home"),
              selectedColor: Theme.of(context).colorScheme.primary,
              unselectedColor: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            // SalomonBottomBarItem(
            //   icon: const Icon(Icons.newspaper),
            //   title: const Text("NewsPaper"),
            //   selectedColor: Theme.of(context).colorScheme.primary,
            //   unselectedColor: Theme.of(context).colorScheme.onSurfaceVariant,
            // ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.bookmark),
              title: const Text("Bookmark"),
              selectedColor: Theme.of(context).colorScheme.primary,
              unselectedColor: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Theme.of(context).colorScheme.primary,
              unselectedColor: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}

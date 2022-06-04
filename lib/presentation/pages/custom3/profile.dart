import 'package:bookque/presentation/pages/upload/upload.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom3/item_collection.dart';
import '../../../data/models/books.dart';
import '../../widgets/custom3/item_filter.dart';
import '../../widgets/custom3/user_profile.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.only(left: 15, top: 15, right: 15),
          child: Column(
            children: [
              Stack(
                children: [
                  const UserProfile(),
                  Positioned(
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const SettingPage()));
                      },
                      child: const Icon(
                        Icons.settings_outlined,
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
              const ItemFilter(),
              const SizedBox(
                height: 15,
              ),
              ItemCollection(items: listBook, onItemTap: () => print('Tapped'))
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const Upload(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

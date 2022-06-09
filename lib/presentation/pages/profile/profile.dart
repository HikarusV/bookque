import 'package:bookque/common/styles.dart';
import 'package:bookque/data/models/books.dart';
import 'package:bookque/presentation/pages/detail/user_detail.dart';
import 'package:bookque/presentation/pages/settings/settings.dart';
import 'package:bookque/presentation/pages/upload/upload.dart';
import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:bookque/presentation/widgets/profile/item_collection.dart';
import 'package:bookque/presentation/widgets/profile/item_filter.dart';
import 'package:bookque/presentation/widgets/profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  Consumer<AccountProv>(
                      builder: (context, value, _) => const UserProfile()),
                  Positioned(
                    right: 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Settings(),
                          ),
                        );
                      },
                      child: const Icon(
                        // Icons.settings_outlined,
                        Icons.settings,
                        size: 28,
                        color: primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
              ItemFilter(),
              const SizedBox(
                height: 15,
              ),
              ItemCollection(
                items: listBook,
                onItemTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const UserDetail(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: primaryColor,
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

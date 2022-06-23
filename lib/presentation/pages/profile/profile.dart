import 'package:bookque/common/state_enum.dart';
import 'package:bookque/data/items.dart';
import 'package:bookque/presentation/pages/settings/settings.dart';
import 'package:bookque/presentation/pages/upload/upload.dart';
import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:bookque/presentation/provider/profile_items_provider.dart';
import 'package:bookque/presentation/widgets/profile/item_collection.dart';
import 'package:bookque/presentation/widgets/profile/item_filter.dart';
import 'package:bookque/presentation/widgets/profile/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/loading_widget/book_item_loading.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<ProfileItemsProvider>(context, listen: false)
          ..fetchProfileItemById(context.read<AccountProv>().userData!.uid));
  }

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
                        Navigator.of(context).pushNamed(Settings.routeName);
                      },
                      child: Icon(
                        Icons.settings,
                        size: 28,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const ItemFilter(),
              const SizedBox(
                height: 15,
              ),
              Consumer<ProfileItemsProvider>(builder: (context, value, _) {
                List items = [];
                bool hasData = false;
                if (value.stateProfileItems == ResultState.loading) {
                  items = CustomShimmer.bookItem(12);
                } else if (value.stateProfileItems == ResultState.hasData) {
                  hasData = true;
                  items = value.dataProfileItems;
                } else if (value.stateProfileItems == ResultState.error) {
                  print('error broh');
                } else {
                  print('in Else');
                }
                return ItemCollection(
                  onLoadingItems: !hasData,
                  items: items,
                );
              }),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).colorScheme.primary,
          onPressed: () async {
            var result;
            await Navigator.of(context)
                .pushNamed(Upload.routeName)
                .then((value) => result = value)
                .whenComplete(() {
              result = null;
            });
            if (result.runtimeType == Items) {
              context.read<ProfileItemsProvider>().addNewData(result);
            }
          },
          child: const Icon(Icons.add, size: 30),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

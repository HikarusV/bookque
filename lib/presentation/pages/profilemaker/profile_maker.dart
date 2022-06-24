import 'package:bookque/common/state_enum.dart';
import 'package:bookque/presentation/provider/profile_maker_provider.dart';
import 'package:bookque/presentation/widgets/profilemaker/nametag.dart';
import 'package:bookque/presentation/widgets/settings/profile_picture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../common/styles.dart';
import '../../provider/account_provider.dart';

class ProfileMaker extends StatefulWidget {
  const ProfileMaker(
      {Key? key,
      required this.onFinish,
      this.usingRequestNewImage = false,
      required this.oldUsername,
      this.imageUrl = ""})
      : super(key: key);
  final Function() onFinish;
  final bool usingRequestNewImage;
  final String oldUsername;
  final String imageUrl;

  @override
  State<ProfileMaker> createState() => _ProfileMakerState();
}

class _ProfileMakerState extends State<ProfileMaker> {
  @override
  initState() {
    super.initState();

    if (widget.usingRequestNewImage) {
      Future.microtask(() =>
          Provider.of<ProfileMakerProvider>(context, listen: false)
            ..getImageUnsplash(widget.oldUsername));
    } else {
      Future.microtask(() =>
          Provider.of<ProfileMakerProvider>(context, listen: false)
            ..initData(widget.oldUsername, widget.imageUrl));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Consumer<ProfileMakerProvider>(
            builder: (context, value, _) {
              if (value.state == ResultState.loading) {
                return const Center(child: CircularProgressIndicator());
              } else if (value.state == ResultState.hasData) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 85,
                          ),
                          ProfilePicturePicker(
                            urlNetwork: value.imageUrl!,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          (value.author != null)
                              ? Text('image by ${value.author} (unsplash)')
                              : Container(),
                          Column(),
                          const SizedBox(
                            height: 80,
                          ),
                          NameTag(
                            controller: value.name,
                          ),
                        ],
                      ),
                      Positioned(
                        bottom: 10,
                        right: 0,
                        child: TextButton(
                          onPressed: () async {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) => const Center(
                                child: CircularProgressIndicator(),
                              ),
                            );

                            await context
                                .read<AccountProv>()
                                .updateUsernamePicture(
                                    value.name.text, value.imageUrl!)
                                .then((value) => Navigator.pop(context));

                            widget.onFinish();
                          },
                          child: Text(
                            'Simpan dan Lanjutkan',
                            style: TextStyle(
                                fontStyle: subText.fontStyle,
                                fontSize: subText.fontSize,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return const Text('Error');
              }
            },
          ),
        ),
      ),
    );
  }
}

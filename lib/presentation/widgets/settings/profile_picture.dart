import 'dart:io';

import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../provider/internet_provider.dart';

class ProfilePicturePicker extends StatefulWidget {
  const ProfilePicturePicker({Key? key, required this.urlNetwork})
      : super(key: key);
  final String urlNetwork;

  @override
  State<ProfilePicturePicker> createState() => _ProfilePicturePickerState();
}

class _ProfilePicturePickerState extends State<ProfilePicturePicker> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipOval(
          child: SizedBox.fromSize(
            size: const Size.fromRadius(80),
            child: context.read<InternetProvider>().isInternetError
                ? Image.asset('assets/profile.png')
                : image != null
                    ? Image.file(image!, fit: BoxFit.fill)
                    : Image.network(
                        widget.urlNetwork,
                        fit: BoxFit.cover,
                      ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 5,
          child: GestureDetector(
            onTap: () async {},
            child: const CircleAvatar(
              backgroundColor: primaryColor,
              child: Icon(
                Icons.create,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

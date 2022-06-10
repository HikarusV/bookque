import 'dart:io';

import 'package:bookque/common/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePicturePicker extends StatefulWidget {
  const ProfilePicturePicker({Key? key}) : super(key: key);

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
            child: image != null
                ? Image.file(image!, fit: BoxFit.fill)
                : Image.network(
                    'https://graph.facebook.com/111968404870160/picture',
                    fit: BoxFit.fill,
                  ),
          ),
        ),
        Positioned(
          bottom: 10,
          right: 5,
          child: GestureDetector(
            onTap: () async {
              try {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                // print(image?.readAsBytes());
                if (image == null) return;

                final imageTemporary = File(image.path);
                setState(() => this.image = imageTemporary);
                // print(image.path);

                // final bytes = File(image.path).readAsBytesSync();

                // String img64 = base64Encode(bytes);
                // print(img64);
              } on PlatformException catch (e) {
                ('$e');
              }
            },
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

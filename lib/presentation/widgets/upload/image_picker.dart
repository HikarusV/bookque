import 'dart:io';

import 'package:bookque/common/styles.dart';
import 'package:bookque/presentation/provider/upload_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../../common/localizations.dart';

class ImagePick extends StatefulWidget {
  const ImagePick({Key? key}) : super(key: key);

  @override
  State<ImagePick> createState() => _ImagePickState();
}

class _ImagePickState extends State<ImagePick> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.imageUploadText,
            style: subText,
          ),
          const SizedBox(
            height: 5,
          ),
          GestureDetector(
            onTap: () async {
              try {
                final image =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                // print(image?.readAsBytes());
                if (image == null) return;

                final imageTemporary = File(image.path);
                setState(() => this.image = imageTemporary);
                context.read<UploadUpdateItemProvider>().images =
                    imageTemporary;
              } on PlatformException catch (e) {
                print('$e');
              }
            },
            child: Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: image != null
                  ? Container(
                      margin: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 140,
                            child: Image.file(
                              image!,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Icon(
                      Icons.cloud_upload_outlined,
                      size: 100,
                      color: Theme.of(context).colorScheme.primary,
                    ),
            ),
          )
        ],
      ),
    );
  }
}

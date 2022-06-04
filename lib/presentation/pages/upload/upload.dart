import 'package:flutter/material.dart';
import '../../widgets/custom/full_button.dart';
import '../../widgets/custom/text_input.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/upload/choose_categories.dart';
import '../../widgets/upload/image_picker.dart';
import 'select_cat.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Unggah',
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const ImagePick(),
              TextInput(controller: TextEditingController()),
              TextInput(controller: TextEditingController()),
              TextInput(controller: TextEditingController()),
              TextInput(
                controller: TextEditingController(),
                minLines: 6,
                maxLines: 6,
              ),
              ChooseCategories(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectCat(),
                  ),
                ),
              ),
              FullButton(onPressed: () => ''),
            ],
          ),
        ),
      ),
    );
  }
}

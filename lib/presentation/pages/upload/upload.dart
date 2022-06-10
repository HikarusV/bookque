import 'package:bookque/presentation/pages/upload/select_category.dart';
import 'package:bookque/presentation/widgets/scroll_behavior_without_glow.dart';
import 'package:flutter/material.dart';

import '../../../common/localizations.dart';
import '../../widgets/custom/full_button.dart';
import '../../widgets/custom/text_input.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/upload/choose_categories.dart';
import '../../widgets/upload/image_picker.dart';

class Upload extends StatelessWidget {
  const Upload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: AppLocalizations.of(context)!.appBarUploadText,
      child: ScrollConfiguration(
        behavior: ScrollBehaviorWithoutGlow(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const ImagePick(),
                TextInput(
                  controller: TextEditingController(),
                  title: AppLocalizations.of(context)!.linkUploadText,
                  textHint:
                      AppLocalizations.of(context)!.linkUploadPlaceholderText,
                ),
                TextInput(
                  controller: TextEditingController(),
                  title: AppLocalizations.of(context)!.titleUploadText,
                  textHint:
                      AppLocalizations.of(context)!.titleUploadPlaceholderText,
                ),
                TextInput(
                  controller: TextEditingController(),
                  title: AppLocalizations.of(context)!.authorUploadText,
                  textHint:
                      AppLocalizations.of(context)!.authorUploadPlaceholderText,
                ),
                TextInput(
                  controller: TextEditingController(),
                  title: AppLocalizations.of(context)!.descriptionText,
                  textHint: AppLocalizations.of(context)!
                      .descriptionploadPlaceholderText,
                  minLines: 6,
                  maxLines: 6,
                ),
                ChooseCategories(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectCategory(),
                    ),
                  ),
                ),
                FullButton(
                  onPressed: () => '',
                  text: AppLocalizations.of(context)!.appBarUploadText,
                  marginBottom: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

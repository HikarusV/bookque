import 'package:bookque/data/models/categories.dart';
import 'package:bookque/presentation/pages/upload/select_category.dart';
import 'package:bookque/presentation/provider/account_provider.dart';
import 'package:bookque/presentation/provider/upload_provider.dart';
import 'package:bookque/presentation/widgets/error/snackbar_error.dart';
import 'package:bookque/presentation/widgets/scroll_behavior_without_glow.dart';
import 'package:bookque/presentation/widgets/upload/type_upload.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:group_button/group_button.dart';
import 'package:provider/provider.dart';

import '../../../common/localizations.dart';
import '../../../common/styles.dart';
import '../../../data/items.dart';
import '../../../data/models/full_items.dart';
import '../../widgets/auth/full_button.dart';
import '../../widgets/auth/text_input.dart';
import '../../widgets/custom_scaffold.dart';
import '../../widgets/upload/choose_categories.dart';
import '../../widgets/upload/image_picker.dart';
import '../../widgets/upload/list_categories_selected.dart';

class Upload extends StatefulWidget {
  static const String routeName = 'UploadPage';

  const Upload({Key? key, this.items, this.isUpdateModule = false})
      : super(key: key);
  final FullItems? items;
  final bool isUpdateModule;

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  TextEditingController url = TextEditingController();

  TextEditingController title = TextEditingController();

  TextEditingController nama = TextEditingController();

  TextEditingController desc = TextEditingController();

  GroupButtonController type = GroupButtonController()..selectIndex((1));

  List errorType = ['pic', 'url', 'title', 'author', 'longdesc', 'cat'];

  String getErrorMessageByType(BuildContext context, String key) {
    List errorMessage = [
      AppLocalizations.of(context)!.emptyImageText,
      AppLocalizations.of(context)!.emptyLinkText,
      AppLocalizations.of(context)!.emptyTitleText,
      AppLocalizations.of(context)!.emptyAuthorText,
      AppLocalizations.of(context)!.emptyDescText,
      AppLocalizations.of(context)!.emptyCategoryText,
    ];

    int index = errorType.indexOf(key);
    String message = index == -1
        ? AppLocalizations.of(context)!.noInternetUploadText
        : errorMessage[index];

    return message;
  }

  // final CategoriesSelectCount count = CategoriesSelectCount(items: []);
  @override
  void initState() {
    super.initState();
    List<ListCategoriesItemsSelect>? buffer = [];
    if (widget.items != null) {
      for (var i in listCategory) {
        if (widget.items!.categories.contains(i.id)) {
          buffer.add(ListCategoriesItemsSelect(i.id, i.name));
        }
      }

      url.text = widget.items!.url;
      title.text = widget.items!.title;
      nama.text = widget.items!.author;
      desc.text = widget.items!.longdesc;

      /// if type and categories want to change

      Future.microtask(() =>
          Provider.of<UploadUpdateItemProvider>(context, listen: false)
            ..itemCat.items.addAll(buffer));
    }
    Future.microtask(() =>
        Provider.of<UploadUpdateItemProvider>(context, listen: false)
          ..clearCache());
  }

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
                widget.isUpdateModule
                    ? Container(
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
                            Container(
                              width: double.infinity,
                              height: 200,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: CachedNetworkImage(
                                  imageUrl: widget.items!.imageid),
                            ),
                          ],
                        ),
                      )
                    : const ImagePick(),
                const SizedBox(
                  height: 9,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),
                      Text(AppLocalizations.of(context)!.themeText,
                          style: subText),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child:
                            TypeUpload(itemsName: uploadType, controller: type),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 9,
                ),
                TextInput(
                  controller: url,
                  maxLength: 130,
                  title: AppLocalizations.of(context)!.linkUploadText,
                  textHint:
                      AppLocalizations.of(context)!.linkUploadPlaceholderText,
                ),
                TextInput(
                  controller: title,
                  maxLength: 150,
                  title: AppLocalizations.of(context)!.titleUploadText,
                  textHint:
                      AppLocalizations.of(context)!.titleUploadPlaceholderText,
                ),
                TextInput(
                  controller: nama,
                  maxLength: 100,
                  title: AppLocalizations.of(context)!.authorUploadText,
                  textHint:
                      AppLocalizations.of(context)!.authorUploadPlaceholderText,
                ),
                TextInput(
                  maxLength: 256,
                  controller: desc,
                  title: AppLocalizations.of(context)!.descriptionText,
                  textHint: AppLocalizations.of(context)!
                      .descriptionploadPlaceholderText,
                  minLines: 6,
                  maxLines: 6,
                ),
                const SizedBox(
                  height: 9,
                ),
                ChooseCategories(
                  onTap: () {
                    if (!widget.isUpdateModule) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SelectCategory(
                            count: context
                                .watch<UploadUpdateItemProvider>()
                                .itemCat,
                            onFinish: () {
                              context
                                  .read<UploadUpdateItemProvider>()
                                  .updateCache();
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      );
                    }
                  },
                ),
                FullButton(
                  onPressed: () async {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                    if (!widget.isUpdateModule) {
                      Map result = await context
                          .read<UploadUpdateItemProvider>()
                          .upload(context.read<AccountProv>().userData!.uid,
                              type: type.selectedIndex!,
                              url: url.text,
                              title: title.text,
                              author: nama.text,
                              longDesc: desc.text);
                      Navigator.pop(context);
                      if (!result['error']) {
                        context.read<UploadUpdateItemProvider>().clearCache();
                        Navigator.pop(
                            context,
                            Items(
                                itemid: result['items']['itemid'],
                                shortdesc: 'ShortDesc',
                                imageid: result['items']['imageid'],
                                author: nama.text,
                                title: title.text));
                      } else {
                        snackbarError(context,
                            duration: 3,
                            message:
                                getErrorMessageByType(context, result['type']));
                      }
                    } else {
                      /// If categories and type want to change
                      /// Algoritma
                      /// bool isTypeChange = (uploadType[type.selectedIndex!] == items!.categories[0]);
                      /// bool checkItems = false;
                      /// var updateCategories = context.read<UploadUpdateItemProvider>().itemCat.items;
                      /// int sourceLength = items!.categories.length;
                      /// for (int i = 1; i < sourceLength; i++) {
                      ///   checkItems = checkItems || updateCategories.contains(items!.categories[i]);
                      /// }
                      /// bool isCategoriesChange = ((updateCategories.length != sourceLength- 1) ||checkItems );
                      await context
                          .read<UploadUpdateItemProvider>()
                          .updateData(
                            context,
                            idUser: context.read<AccountProv>().userData!.uid,
                            id: widget.items!.itemid,
                            url: (url.text != widget.items!.url)
                                ? url.text.trim()
                                : 'none',
                            author: (nama.text != widget.items!.author)
                                ? nama.text.replaceAll('"', '\'')
                                : 'none',
                            title: (title.text != widget.items!.title)
                                ? title.text.replaceAll('"', '\'')
                                : 'none',
                            longDesc: (desc.text != widget.items!.longdesc)
                                ? desc.text.replaceAll('"', '\'')
                                : 'none',
                          )
                          .then((value) => Navigator.pop(context));
                      Navigator.pop(context);
                    }
                  },
                  text: (widget.isUpdateModule)
                      ? 'Update'
                      : AppLocalizations.of(context)!.appBarUploadText,
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

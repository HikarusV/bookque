import 'dart:convert';
import 'dart:io';

import 'package:bookque/common/state_enum.dart';
import 'package:bookque/data/datasource/api_handler/api_helper.dart';
import 'package:bookque/presentation/widgets/error/snackbar_error.dart';
import 'package:bookque/presentation/widgets/upload/list_categories_selected.dart';
import 'package:flutter/material.dart';

import '../../common/localizations.dart';
import '../../data/models/categories.dart';

class UploadUpdateItemProvider with ChangeNotifier {
  ResultState _stateUploadItem = ResultState.noData;
  File? images = File('none');
  CategoriesSelectCount itemCat = CategoriesSelectCount(items: []);
  String _uploadItemsMessage = 'Empty';

  ResultState get stateUploadItems => _stateUploadItem;
  String get uploadItemsMessage => _uploadItemsMessage;

  void reset() {
    _stateUploadItem = ResultState.noData;
    itemCat = CategoriesSelectCount(items: []);
    _uploadItemsMessage = 'Empty';
  }

  void updateCache() {
    notifyListeners();
  }

  void initItemsCat(List<ListCategoriesItemsSelect> itemList) {
    itemCat.items.addAll(itemList);
    notifyListeners();
  }

  void clearCache() {
    itemCat.selectedCat = 0;
    itemCat.items.clear();
    notifyListeners();
  }

  Future<Map<String, dynamic>> upload(String id,
      {required int type,
      required String url,
      required String title,
      required String author,
      required String longDesc}) async {
    try {
      if (images!.path == 'none') {
        throw 'pic';
      } else if (url.isEmpty) {
        throw 'url';
      } else if (title.isEmpty) {
        throw 'title';
      } else if (author.isEmpty) {
        throw 'author';
      } else if (longDesc.isEmpty) {
        throw 'longdesc';
      } else if (itemCat.items.isEmpty) {
        throw 'cat';
      }

      String cat = itemCat
          .getIdText()
          .replaceAll(RegExp("'"), '')
          .replaceAll(RegExp(r'\s+'), '');

      final bytes = File(images!.path).readAsBytesSync();
      String img64 = base64Encode(bytes);

      final response = await HandleApi.postItem(id, img64, uploadType[type],
          url, title, author, 'ShortDesc', longDesc, cat);

      images = File('none');
      clearCache();

      return response;
    } catch (e) {
      return {'error': true, 'type': e.toString()};
    }
  }

  Future<void> updateData(
    BuildContext context, {
    required String idUser,
    required String id,
    String cover = "none",
    String url = "none",
    String title = "none",
    String author = "none",
    String shortDescription = "none",
    String longDesc = "none",
  }) async {
    try {
      final response = await HandleApi.putItemUser(
        idUser: idUser,
        id: id,
        url: url,
        title: title,
        author: author,
        shortDescription: shortDescription,
        longDesc: longDesc,
      );
      clearCache();
      snackbarError(context,
          duration: 3, message: '${response['status']} Update Data');
    } catch (e) {
      snackbarError(context, duration: 3, message: e.toString());
    }
  }

  Future deletedData(BuildContext context,
      {required String userId, required id}) async {
    try {
      bool result = await HandleApi.deleteAlbum(userId, id);

      String message = !result
          ? AppLocalizations.of(context)!.successDeleteDataText
          : AppLocalizations.of(context)!.failDeleteDataText;

      snackbarError(context, duration: 3, message: message);
      return result;
    } catch (e) {
      snackbarError(context,
          duration: 3,
          message: AppLocalizations.of(context)!.noInternetDeleteText);
    }
  }
}

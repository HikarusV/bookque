import 'dart:convert';
import 'dart:io';

import 'package:bookque/common/state_enum.dart';
import 'package:bookque/data/datasource/api_handler/api_helper.dart';
import 'package:bookque/presentation/widgets/upload/list_categories_selected.dart';
import 'package:flutter/material.dart';

import '../../data/models/categories.dart';

class UploadUpdateItemProvider with ChangeNotifier {
  ResultState _stateUploadItem = ResultState.noData;
  File? images;
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
      String cat = itemCat.items
          .toString()
          .substring(1, (itemCat.items.toString().length - 1))
          .replaceAll(RegExp(r'\s+'), '');

      final bytes = File(images!.path).readAsBytesSync();
      String img64 = base64Encode(bytes);

      final response = await HandleApi.postItem(id, img64, uploadType[type],
          url, title, author, 'ShortDesc', longDesc, cat);

      return response;
    } catch (e) {
      return {'error': true};
    }
  }

  Future<void> updateData({
    required String idUser,
    required String id,
    String cover = "none",
    String url = "none",
    String title = "none",
    String author = "none",
    String shortDescription = "none",
    String longDesc = "none",
  }) async {
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
  }

  Future deletedData({required String userId, required id}) async {
    bool result = await HandleApi.deleteAlbum(userId, id);

    return result;
  }
}

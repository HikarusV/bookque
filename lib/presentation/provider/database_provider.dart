import 'package:bookque/common/state_enum.dart';
import 'package:bookque/data/db/database_helper.dart';
import 'package:bookque/data/items.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {
  late DatabaseHelper databaseHelper;

  DatabaseProvider() {
    databaseHelper = DatabaseHelper();
  }

  ResultState _state = ResultState.noData;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<Items> _bookmarks = [];
  List<Items> get bookmarks => _bookmarks;

  Future getBookmarks() async {
    try {
      _state = ResultState.loading;
      notifyListeners();

      _bookmarks = await databaseHelper.getBookmarks();

      if (_bookmarks.isNotEmpty) {
        _state = ResultState.hasData;
      } else {
        _state = ResultState.noData;
        _message = 'Empty Data';
      }
      notifyListeners();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  void addBookmark(Items items) async {
    try {
      await databaseHelper.insertBookmark(items);
      getBookmarks();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isBookmarked(String itemid) async {
    final bookmarkedItem = await databaseHelper.getBookmarkById(itemid);
    return bookmarkedItem.isNotEmpty;
  }

  void removeBookmark(String itemid) async {
    try {
      await databaseHelper.removeBookmark(itemid);
      getBookmarks();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }
}

import 'package:bookque/common/state_enum.dart';
import 'package:bookque/data/datasource/api_handler/api_helper.dart';
import 'package:flutter/material.dart';

import '../../data/items.dart';

class SearchProvider with ChangeNotifier {
  ResultState _stateSearch = ResultState.noData;
  List<Items> _dataSearch = [];
  String _searchMessage = 'Empty';

  ResultState get stateSearch => _stateSearch;
  List<Items> get dataSearch => _dataSearch;
  String get searchMessage => _searchMessage;

  void searchKeyword(String keyword) async {
    _stateSearch = ResultState.loading;
    notifyListeners();

    try {
      final result = await HandleApi.getSearch(keyword);

      await Future.delayed(const Duration(seconds: 4));

      if (!result['error']) {
        _stateSearch = ResultState.hasData;
        _dataSearch = result['items'];
      }

      _searchMessage = result['message'];
      notifyListeners();
    } catch (e) {
      _searchMessage = e.toString();
      _stateSearch = ResultState.error;
      notifyListeners();
    }
  }
}

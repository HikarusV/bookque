import 'package:bookque/common/state_enum.dart';
import 'package:bookque/data/datasource/api_handler/api_helper.dart';
import 'package:bookque/data/items.dart';
import 'package:flutter/material.dart';

class CategoriesProvider with ChangeNotifier {
  ResultState _stateCategories = ResultState.noData;
  final Map<String, List<Items>> _dataCategories = {};
  String _categoriesMessage = 'Empty';

  ResultState get stateCategories => _stateCategories;
  Map<String, List<Items>> get dataCategories => _dataCategories;
  String get categoriesMessage => _categoriesMessage;

  void fetchCategoriesItem(String keyword) async {
    _stateCategories = ResultState.loading;
    notifyListeners();
    if (_dataCategories.containsKey(keyword)) {
      _stateCategories = ResultState.hasData;
      _categoriesMessage = 'Data telah ditemukan';
      notifyListeners();
    } else {
      try {
        final result = await HandleApi.getCategory(keyword);

        if (!result['error']) {
          _stateCategories = ResultState.hasData;
          _dataCategories[keyword] = result['items'];
        }

        _categoriesMessage = result['message'];
        notifyListeners();
      } catch (e) {
        _categoriesMessage = e.toString();
        _stateCategories = ResultState.error;
        notifyListeners();
      }
    }
  }
}

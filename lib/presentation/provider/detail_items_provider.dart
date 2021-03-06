import 'package:bookque/common/state_enum.dart';
import 'package:bookque/data/datasource/api_handler/api_helper.dart';
import 'package:bookque/data/models/full_items.dart';
import 'package:flutter/material.dart';

class DetailItemsProvider with ChangeNotifier {
  ResultState _stateDetailItems = ResultState.noData;
  final Map<String, FullItems> _dataDetailItems = {};
  String _detailItemsMessage = 'Empty';

  ResultState get stateDetailItems => _stateDetailItems;
  Map<String, FullItems> get dataDetailItems => _dataDetailItems;
  String get detailItemsMessage => _detailItemsMessage;

  void fetchDetailItemById(String id) async {
    bool isFirstLoad = true;
    _stateDetailItems = ResultState.loading;
    notifyListeners();

    try {
      while (_stateDetailItems == ResultState.loading) {
        if (!isFirstLoad) {
          await Future.delayed(const Duration(seconds: 2));
        }
        isFirstLoad = false;
        final result = await HandleApi.getDetailItems(id);

        if (!result.error) {
          _stateDetailItems = ResultState.hasData;
          _dataDetailItems[id] = result.items;
          _detailItemsMessage = result.message;
          notifyListeners();
        }
      }
    } catch (e) {
      _detailItemsMessage = e.toString();
      _stateDetailItems = ResultState.error;
      notifyListeners();
    }
  }
}

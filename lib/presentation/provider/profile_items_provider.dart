import 'package:bookque/common/state_enum.dart';
import 'package:bookque/data/datasource/api_handler/api_helper.dart';
import 'package:bookque/data/items.dart';
import 'package:flutter/material.dart';

class ProfileItemsProvider with ChangeNotifier {
  ResultState _stateProfileItems = ResultState.noData;
  List<Items> _dataProfileItems = [];
  String _profiletemsMessage = 'Empty';

  ResultState get stateProfileItems => _stateProfileItems;
  List<Items> get dataProfileItems => _dataProfileItems;
  String get profiletemsMessage => _profiletemsMessage;

  void addNewData(Items newItem) {
    _dataProfileItems.add(newItem);
    notifyListeners();
  }

  void removeData(int index) {
    _dataProfileItems.removeAt(index);
    notifyListeners();
  }

  void fetchProfileItemById(String id) async {
    _stateProfileItems = ResultState.loading;
    notifyListeners();
    // await Future.delayed(const Duration(seconds: 2));

    try {
      final result = await HandleApi.getItems(id);
      if (!result.error) {
        _stateProfileItems = ResultState.hasData;
        _dataProfileItems = result.items;
      }

      _profiletemsMessage = result.message;
      notifyListeners();
    } catch (e) {
      _profiletemsMessage = e.toString();
      _stateProfileItems = ResultState.error;
      notifyListeners();
    }
  }
}

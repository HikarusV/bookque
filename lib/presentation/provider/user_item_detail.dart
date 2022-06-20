import 'package:bookque/common/state_enum.dart';
import 'package:bookque/data/datasource/api_handler/api_helper.dart';
import 'package:bookque/data/models/full_items.dart';
import 'package:flutter/material.dart';

class UserDetailItemsProvider with ChangeNotifier {
  ResultState _stateUserDetailItems = ResultState.noData;
  final Map<String, FullItems> _dataUserDetailItems = {};
  String _userDetailItemsMessage = 'Empty';

  ResultState get stateUserDetailItems => _stateUserDetailItems;
  Map<String, FullItems> get dataUserDetailItems => _dataUserDetailItems;
  String get userDetailItemsMessage => _userDetailItemsMessage;

  void fetchDetailItemById(String id) async {
    _stateUserDetailItems = ResultState.loading;
    notifyListeners();
    // await Future.delayed(const Duration(seconds: 2));

    try {
      final result = await HandleApi.getDetailItems(id);

      if (!result.error) {
        _stateUserDetailItems = ResultState.hasData;
        _dataUserDetailItems[id] = result.items;
      }

      _userDetailItemsMessage = result.message;
      notifyListeners();
    } catch (e) {
      _userDetailItemsMessage = e.toString();
      _stateUserDetailItems = ResultState.error;
      notifyListeners();
    }
  }
}

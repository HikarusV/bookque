import 'package:bookque/data/datasource/api_handler/api_helper.dart';
import 'package:flutter/material.dart';

import '../../common/state_enum.dart';

class ProviderDeleteApi extends ChangeNotifier {
  late final HandleApi getHandleApi;
  late ResultState _resultState;
  ResultState get resultState => _resultState;
  String _message = '';
  String get message => _message;

  Future<dynamic> deletingItem(
    String userId,
    String id,
  ) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      await HandleApi.deleteAlbum(
        userId,
        id,
      ).then(
          (value) => {_resultState = ResultState.hasData, notifyListeners()});
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}

import 'package:flutter/cupertino.dart';

import '../../common/state_enum.dart';
import '../../data/datasource/api_handler/api_helper.dart';

class ProviderPutApi extends ChangeNotifier {
  late final HandleApi getHandleApi;
  late ResultState _resultState;
  ResultState get resultState => _resultState;
  String _message = '';
  String get message => _message;

  Future<dynamic> putingItemUser(
    String idUser,
    String id,
    String cover,
    String tipe,
    String url,
    String title,
    String author,
    String description,
    List categories,
  ) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      await HandleApi.putItemUser(
        idUser: idUser,
        id: id,
      ).then(
          (value) => {_resultState = ResultState.hasData, notifyListeners()});
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }

  Future<dynamic> putingProfile(
    String idUser,
    String nama,
    String email,
    String username,
    int profilid,
  ) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      await HandleApi.putProfile(
        idUser,
        nama,
        email,
        username,
        profilid,
      ).then(
          (value) => {_resultState = ResultState.hasData, notifyListeners()});
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}

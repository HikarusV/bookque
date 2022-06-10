import 'package:flutter/cupertino.dart';

import '../../common/state_enum.dart';
import '../../data/datasource/api_handler/api_helper.dart';

class ProviderPostApi extends ChangeNotifier {
  late final HandleApi getHandleApi;
  late ResultState _resultState;
  ResultState get resultState => _resultState;
  String _message = '';
  String get message => _message;

  Future<dynamic> postingItem(
      String idUser,
      String cover,
      String tipe,
      String url,
      String title,
      String author,
      String shortDescription,
      String longDesc,
      String categories) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();

      await HandleApi.postItem(
        idUser,
        cover,
        tipe,
        url,
        title,
        author,
        shortDescription,
        longDesc,
        categories,
      ).then(
          (value) => {_resultState = ResultState.hasData, notifyListeners()});
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }

  Future<dynamic> postReport(
    String idUser,
    String id,
    String pornografi,
    String link,
    String kategori,
    String plagiat,
    String rasis,
  ) async {
    try {
      _resultState = ResultState.loading;
      notifyListeners();
      await HandleApi.postReport(id, pornografi, link, kategori, plagiat, rasis)
          .then((value) =>
              {_resultState = ResultState.hasData, notifyListeners()});
    } catch (e) {
      _resultState = ResultState.error;
      notifyListeners();
      return _message = 'Error --> $e';
    }
  }
}

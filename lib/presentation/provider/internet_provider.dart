import 'dart:io';

import 'package:bookque/common/state_enum.dart';
import 'package:flutter/material.dart';

class InternetProvider with ChangeNotifier {
  ResultState _stateInternet = ResultState.noData;

  ResultState get stateInternet => _stateInternet;

  Future init() async {
    _stateInternet = ResultState.loading;
    notifyListeners();

    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setIsInternetError(false);
      }
    } on SocketException catch (_) {
      setIsInternetError(true);
    }

    _stateInternet = ResultState.hasData;
    notifyListeners();
  }

  bool _isInternetError = false;

  bool get isInternetError => _isInternetError;

  void setIsInternetError(bool value) {
    _isInternetError = value;
    notifyListeners();
  }
}

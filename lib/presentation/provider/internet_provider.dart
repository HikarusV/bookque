import 'dart:io';

import 'package:flutter/material.dart';

class InternetProvider with ChangeNotifier {
  Future init() async {
    try {
      final result = await InternetAddress.lookup('www.google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setIsInternetError(false);
      }
    } on SocketException catch (_) {
      setIsInternetError(true);
    }
  }

  bool _isInternetError = false;

  bool get isInternetError => _isInternetError;

  void setIsInternetError(bool value) {
    _isInternetError = value;
    notifyListeners();
  }
}

import 'package:bookque/common/state_enum.dart';
import 'package:flutter/material.dart';

import '../../common/state_enum.dart';
import '../../data/datasource/api_handler/api_helper.dart';

class HomeProvider with ChangeNotifier {
  String messageRecomendationData = '';
  String messageNewsData = '';

  ResultState _staterecommendationData = ResultState.noData;
  ResultState _statenewsData = ResultState.noData;

  ResultState get getstaterecommendationData => _staterecommendationData;
  ResultState get getstatenewsData => _statenewsData;

  List dataRandomRecomendationItems = [];
  List dataNewsItems = [];

  Future<void> fetchRecomendationData() async {
    _staterecommendationData = ResultState.loading;
    notifyListeners();

    try {
      final result = await HandleApi.getRecommendationRandomItem();

      if (!result['error']) {
        messageRecomendationData = result['message'];
        dataRandomRecomendationItems = result['items'];
        _staterecommendationData = ResultState.hasData;
        notifyListeners();
      }
    } catch (e) {
      messageRecomendationData = e.toString();
      _staterecommendationData = ResultState.error;
      notifyListeners();
    }
  }

  Future<void> fetchNewsData(String userid) async {
    _statenewsData = ResultState.loading;
    notifyListeners();

    try {
      final result = await HandleApi.getNewestItems(userid);

      if (!result['error']) {
        dataNewsItems = result['items'];
        messageNewsData = result['message'];
        _statenewsData = ResultState.hasData;
        notifyListeners();
      }
      notifyListeners();
    } catch (e) {
      _statenewsData = ResultState.error;
      messageNewsData = e.toString();
      notifyListeners();
    }
  }
}

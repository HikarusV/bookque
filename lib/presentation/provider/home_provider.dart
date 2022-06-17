import 'package:bookque/common/state_enum.dart';
import 'package:flutter/material.dart';

import '../../common/state_enum.dart';
import '../../data/datasource/api_handler/api_helper.dart';

class HomeProvider with ChangeNotifier {
  int _pages = 1;

  Widget nextButton = Container(
    child: Text('Selanjutnya'),
  );

  String messageRecomendationData = '';
  String messageNewsData = '';

  int get pages => _pages;

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

  void incrementPages() {
    _pages++;
  }

  void changeNextButton() {
    if (_pages < 5) {
      nextButton = Center(
        child: TextButton(
          onPressed: () {
            incrementPages();
            fetchNewsData('xax');
          },
          child: const Text('Selanjutnya'),
        ),
      );
    } else {
      nextButton = Container();
    }
  }

  Future<void> fetchNewsData(String userid) async {
    if (_pages == 1) {
      _statenewsData = ResultState.loading;
      notifyListeners();
    }
    nextButton = const Center(
      child: CircularProgressIndicator(),
    );

    try {
      final result = await HandleApi.getNewestItems(userid, pages: _pages);

      if (!result['error']) {
        dataNewsItems.insertAll(0, result['items']);
        messageNewsData = result['message'];
        _statenewsData = ResultState.hasData;
        changeNextButton();
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